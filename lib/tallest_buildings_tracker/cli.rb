require "pry"
class TallestBuildingsTracker::CLI
    def call
        puts "#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#"
        puts "Welcome to the Tallest Buildings Tracker!"
        puts "#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#"
        @input = ""
        until @input == "exit"
            get_buildings
            list_buildings
            get_user_building
            follow_up
        end
        goodbye
    end

    def get_buildings
        @buildings = TallestBuildingsTracker::Building.all
    end

    def list_buildings
        puts "This list is kept up to date via Pick a building from the world's tallest 100 buildings list (given the building's corresponding number/rank) to learn more about it! Did you learn enough (or have a fear of heights)? Type 'exit' in the terminal to exit the program at any time."
        puts ""
        @buildings.each_with_index do |building, index|
            puts "#{index+1}. #{building.name.first}"
        end
    end
# Make custom user input to check exit

    def get_user_building
        chosen_building = gets.strip.to_i
        if @input == "exit"
            goodbye
        elsif valid_input(chosen_building, @buildings)
            show_info_for(chosen_building)
        else
            puts "That's not a valid input! Please press ENTER to continue and then type 1-100 in correspondence to the building that you wish to learn more about."
        end
    end

    def valid_input(input, data)
        input.to_i <= data.length && input.to_i > 0
    end

    def show_info_for(chosen_building)
        building = @buildings[chosen_building-1]
        building.get_info

        #use select on Info.all 
        # you find that instance of INFO in the @@ALL and save it into a variable 
        # info.city or info.completion

        #TallestBuildingsTracker::Info.all.select do |city, completion, height_in_meters, height_in_feet, name, floors, material, function|
        #    puts ""
        #    puts "Excellent choice! Here are some statistics for the #{building.name.first}:"
        #    puts "This building is located in #{city.name} and was completed in #{completion}. It is #{height_in_meters}/#{height_in_feet} tall. The #{name} has #{floors} floors, is made of #{material}, and serves the function of #{function}!"
        #    puts ""
        #end

        #USE PRY HERE TO FIGURE OUT HOW TO GET THE ARRAY OBJECTS INTO ONE BIG ARRAY FOR EACH BUILDING
        binding.pry
        puts ""
        puts "Excellent choice! Here are some statistics for the #{building.name}:"
        puts "This building is located in #{TallestBuildingsTracker::Info.all[0]} and was completed in #{TallestBuildingsTracker::Info.all[1].name}. It is #{TallestBuildingsTracker::Info.all[2].name}/#{TallestBuildingsTracker::Info.all[3].name} tall. The #{TallestBuildingsTracker::Info.all[4].name} has #{TallestBuildingsTracker::Info.all[5].name} floors, is made of #{TallestBuildingsTracker::Info.all[6].name}, and serves the function of #{TallestBuildingsTracker::Info.all[7].name}!"
        puts ""
        follow_up
    end

    def follow_up
        "Pretty neat, huh? Now that you are that much more knowledgable, type 'exit' to have fun elsewhere or any other key to return to the list of buildings to learn some more."
        @input = gets.strip
    end
    
    def goodbye
        "Thanks for stopping by the Tallest Buildings Tracker! No need to thank me for I can only imagine how much better your life is now that you have learned more about the tallest buildings in the world. Toodles!"
    end
end