require "pry"
class TallestBuildingsTracker::CLI
    def call
        TallestBuildingsTracker::AsciiSkyscraperImage.show_image
        border
        puts "Welcome to the Tallest Buildings Tracker!".colorize(:yellow)
        border
        get_buildings
        list_buildings
    end

    def border
        puts ""
        puts "#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#".colorize(:green)
        puts ""
    end
    
    def get_buildings
        @buildings = TallestBuildingsTracker::Info.all
    end
    
    def list_buildings
        list_buildings_preface
        puts ""
        @buildings.each do |building|
            puts "#{building.rank}. #{building.name}"
        end
        puts ""
        puts "---(Copied from above)---".colorize(:yellow)
        puts ""
        list_buildings_preface
        border
        get_user_building
    end

    def list_buildings_preface
        puts "This list is kept up to date via https://www.skyscrapercenter.com/buildings.".colorize(:yellow)
        puts "Pick a building from the world's tallest 100 buildings list (given the building's corresponding number/rank) to learn more about it!".colorize(:yellow)
        puts "Did you learn enough (or have a fear of heights)? Type 'exit' in the terminal to exit the program at any time.".colorize(:yellow)
    end
    
    def get_user_building
        chosen_building = gets.strip
        if chosen_building == "exit"
            goodbye
        elsif chosen_building == "list"
            list_buildings
        else
            if valid_input(chosen_building.to_i, @buildings)
                show_info_for(chosen_building.to_i)
            else
                puts ""
                puts "That's not a valid input! Please input 1-100 in correspondence to the building that you wish to learn more about, or 'list' to see the list again. Input 'exit' to exit the program.".colorize(:yellow)
                puts ""
                get_user_building
            end
        end
    end

    def valid_input(input, data)
        input.to_i <= data.length && input.to_i > 0
    end

    def show_info_for(chosen_building)
        building = @buildings[chosen_building-1]
        border
        puts "Excellent choice! Here are some statistics for the #{building.name}:".colorize(:yellow)
        puts ""
        puts "Location (city): #{building.city}"
        puts "Year of completion:#{building.completion}"
        puts "Height (meters/feet): #{building.height_in_meters} / #{building.height_in_feet}"
        puts "Floor count:#{building.floors}"
        puts "Material:#{building.material}"
        puts "Function(s):#{building.function}"
        puts ""
        follow_up
    end

    def follow_up
        puts "Pretty neat, huh? Now that you are that much more knowledgable, type 'exit' to have fun elsewhere, or press ENTER to return to the list of buildings to learn some more.".colorize(:yellow)
        border
        loop do
            @input = gets.strip
            if @input == "exit"
                goodbye
                break
            elsif @input == ""
                list_buildings
                break
            else @input =! "exit" || ""
                puts ""
                puts "That's not a valid input! Please either input ENTER to go back to the building selection or 'exit' to exit the program.".colorize(:yellow)
                puts ""
            end
        end
    end

    def goodbye
        puts ""
        puts "Thanks for stopping by the Tallest Buildings Tracker! No need to thank me.".colorize(:yellow)
        puts "I can only imagine how much better your life is now that you have learned more about the tallest buildings in the world.".colorize(:yellow)
        puts "Toodles!".colorize(:yellow)
        border
    end
end