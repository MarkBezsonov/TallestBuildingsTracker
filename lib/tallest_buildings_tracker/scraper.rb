class TallestBuildingsTracker::Scraper
    def self.scrape_buildings
        url = "https://www.skyscrapercenter.com/buildings"

        doc = open(url)
        content = doc.read
        parsed_content = Nokogiri::HTML(content)

        parsed_content.css("tbody").css("tr").each do |row|
            rank = []
            rank_v = row.css("td").css("p")[0].text.gsub(/\s+/, " ")
            rank << rank_v
            name = []
            name_v = row.css("td").css("p")[1].text.gsub(/\s+/, " ")
            name << name_v
            TallestBuildingsTracker::Building.new(rank, name)
        end
    end

    def self.scrape_info
        url = "https://www.skyscrapercenter.com/buildings"

        doc = open(url)
        content = doc.read
        parsed_content = Nokogiri::HTML(content)

        parsed_content.css("tbody").css("tr").each do |row|
            rank = []
            rank_v = row.css("td").css("p")[0].text.gsub(/\s+/, " ")
            rank << rank_v
            name = []
            name_v = row.css("td").css("p")[1].text.gsub(/\s+/, " ")
            name << name_v
            city = []
            city_v = row.css("td").css("p")[2].text.gsub(/\s+/, " ")
            city << city_v
            completion = []
            completion_v = row.css("td").css("p")[3].text.gsub(/\s+/, " ")
            completion << completion_v
            height_in_meters = []
            height_in_meters_v = row.css("td").css("p")[4].text.gsub(/\s+/, " ")
            height_in_meters << height_in_meters_v
            height_in_feet = []
            height_in_feet_v = row.css("td").css("p")[6].text.gsub(/\s+/, " ")
            height_in_feet << height_in_feet_v
            floors = []
            floors_v = row.css("td").css("p")[7].text.gsub(/\s+/, " ")
            floors << floors_v
            material = []
            material_v = row.css("td").css("p")[8].text.gsub(/\s+/, " ")
            material << material_v
            function = []
            function_v = row.css("td").css("p")[9].text.gsub(/\s+/, " ")
            function << function_v
            TallestBuildingsTracker::Info.new(city, completion, height_in_meters, height_in_feet, floors, material, function)
        end
    end
end

