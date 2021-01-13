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
        #binding.pry
    end

    def list_buildings
        puts "Pick a building from the world's tallest 100 buildings list (given the building's corresponding number) to learn more about it! Did you learn enough (or have a fear of heights)? Type 'exit' in the terminal to exit the program at any time."
        @buildings.each_with_index(1) do |building, index|
            puts "#{index}. #{building.name}"
        end
    end

    def get_user_building
        chosen_building = gets.strip.to_i
        show_info_for(chosen_building) if valid_input(chosen_building, @buildings)
    end

    def valid_input(input, data)
        input.to_i <= data.length && input.to_i > 0
    end

    def show_info_for(chosen_building)
        building = @buildings[chosen_building-1]
        building.get_info
        puts "Excellent choice! Here are some statistics for the #{building.name}:"
        building.info.each_with_index(1) do |index, info|
            puts "#{index}. #{info}."
        end
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