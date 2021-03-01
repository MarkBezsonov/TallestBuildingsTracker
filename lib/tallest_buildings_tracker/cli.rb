require "pry"
class TallestBuildingsTracker::CLI
    def call
        puts ""
        puts "#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#"
        puts "Welcome to the Tallest Buildings Tracker!"
        puts "#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#"
        puts ""
        get_buildings
        list_buildings
    end
    
    def get_buildings
        @buildings = TallestBuildingsTracker::Info.all
    end
    
    def list_buildings
        puts "This list is kept up to date via https://www.skyscrapercenter.com/buildings."
        puts "Pick a building from the world's tallest 100 buildings list (given the building's corresponding number/rank) to learn more about it!"
        puts "Did you learn enough (or have a fear of heights)? Type 'exit' in the terminal to exit the program at any time."
        puts ""
        @buildings.each do |building|
            puts "#{building.rank}. #{building.name}"
        end
        puts ""
        puts "---(Copied from above)---"
        puts ""
        puts "This list is kept up to date via https://www.skyscrapercenter.com/buildings."
        puts "Input a building from the world's tallest 100 buildings list (given the building's corresponding number/rank) to learn more about it!"
        puts "Did you learn enough (or have a fear of heights)? Input 'exit' in the terminal to exit the program at any time."
        puts ""
        get_user_building
    end
    
    def get_user_building
        chosen_building = gets.strip
        if chosen_building == "exit"
            goodbye
        elsif chosen_building == "list"
            list_buildings
        else
            if chosen_building != "exit" && valid_input(chosen_building.to_i, @buildings)
                show_info_for(chosen_building.to_i)
            else
                puts "That's not a valid input! Please input 1-100 in correspondence to the building that you wish to learn more about, or 'list' to see the list again. Input 'exit' to exit the program."
                get_user_building
            end
        end
    end

    def valid_input(input, data)
        input.to_i <= data.length && input.to_i > 0
    end

    def show_info_for(chosen_building)
        building = @buildings[chosen_building-1]
        puts ""
        puts "Excellent choice! Here are some statistics for the #{building.name}:"
        puts ""
        puts "Location (city): #{TallestBuildingsTracker::Info.all[chosen_building-1].city}"
        puts "Year of completion:#{TallestBuildingsTracker::Info.all[chosen_building-1].completion}"
        puts "Height (meters/feet): #{TallestBuildingsTracker::Info.all[chosen_building-1].height_in_meters} / #{TallestBuildingsTracker::Info.all[chosen_building-1].height_in_feet}"
        puts "Floor count:#{TallestBuildingsTracker::Info.all[chosen_building-1].floors}"
        puts "Material:#{TallestBuildingsTracker::Info.all[chosen_building-1].material}"
        puts "Function(s):#{TallestBuildingsTracker::Info.all[chosen_building-1].function}"
        puts ""
        follow_up
    end

    def follow_up
        puts "Pretty neat, huh? Now that you are that much more knowledgable, type 'exit' to have fun elsewhere, or press ENTER to return to the list of buildings to learn some more."
        @input = gets.strip
        if @input == "exit"
            goodbye
        elsif @input == ""
            list_buildings
        else @input =! "exit" || ""
            puts "That's not a valid input! Please either input ENTER to go back to the building selection or 'exit' to exit the program."
            follow_up_loop
        end
    end
    
    def follow_up_loop
        @input = gets.strip
        if @input == "exit"
            goodbye
        elsif @input == ""
            list_buildings
        else @input =! "exit" || ""
            puts "That's not a valid input! Please either input ENTER to go back to the building selection or 'exit' to exit the program."
            follow_up_loop
        end
    end

    def goodbye
        puts ""
        puts "Thanks for stopping by the Tallest Buildings Tracker! No need to thank me for I can only imagine how much better your life is now that you have learned more about the tallest buildings in the world. Toodles!"
        puts ""
    end
end