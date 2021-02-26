class TallestBuildingsTracker::Scraper
    def self.scrape_buildings
        url = "https://www.skyscrapercenter.com/buildings"

        doc = open(url)
        content = doc.read
        parsed_content = Nokogiri::HTML(content)

        parsed_content.css("tbody").css("tr").each do |row|
            name = []
            name_v = row.css("td").css("p")[1].text.gsub(/\s+/, " ")
            name << name_v
            TallestBuildingsTracker::Info.name << name_v
            TallestBuildingsTracker::Building.new(name)
        end
    end
#GET RID OF BUILDING CLASS AND COMBINE THE 2. _V VARIABLE IS THE ONE THAT RESULTS IN A STRING INSTEAD OF AN ARRAY WHICH IS WHAT YOU WANT. GO THROUGH THE CLI AND UPDATE ACCORDINGLY.
    def self.scrape_info(building)
        url = "https://www.skyscrapercenter.com/buildings"

        doc = open(url)
        content = doc.read
        parsed_content = Nokogiri::HTML(content)
 
        parsed_content.css("tbody").css("tr").each do |row|
            city = []
            city_v = row.css("td").css("p")[2].text.gsub(/\s+/, " ")
            city << city_v
            TallestBuildingsTracker::Info.city << city_v #EXPERIMENTAL
            completion = []
            completion_v = row.css("td").css("p")[3].text.gsub(/\s+/, " ")
            completion << completion_v
            TallestBuildingsTracker::Info.completion << completion_v #EXPERIMENTAL
            height_in_meters = []
            height_in_meters_v = row.css("td").css("p")[4].text.gsub(/\s+/, " ")
            height_in_meters << height_in_meters_v
            TallestBuildingsTracker::Info.height_in_meters << height_in_meters_v #EXPERIMENTAL
            height_in_feet = []
            height_in_feet_v = row.css("td").css("p")[6].text.gsub(/\s+/, " ")
            height_in_feet << height_in_feet_v
            TallestBuildingsTracker::Info.height_in_feet << height_in_feet_v #EXPERIMENTAL
            floors = []
            floors_v = row.css("td").css("p")[7].text.gsub(/\s+/, " ")
            floors << floors_v
            TallestBuildingsTracker::Info.floors << floors_v #EXPERIMENTAL
            material = []
            material_v = row.css("td").css("p")[8].text.gsub(/\s+/, " ")
            material << material_v
            TallestBuildingsTracker::Info.material << material_v #EXPERIMENTAL
            function = []
            function_v = row.css("td").css("p")[9].text.gsub(/\s+/, " ")
            function << function_v
            TallestBuildingsTracker::Info.function << function_v #EXPERIMENTAL
            TallestBuildingsTracker::Info.new(city_v, completion_v, height_in_meters_v, height_in_feet_v, floors_v, material_v, function_v)
            #binding.pry
        end
    end
end

