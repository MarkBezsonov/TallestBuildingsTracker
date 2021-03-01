class TallestBuildingsTracker::Scraper
    def self.scrape_info
        url = "https://www.skyscrapercenter.com/buildings"

        doc = open(url)
        content = doc.read
        parsed_content = Nokogiri::HTML(content)
 
        parsed_content.css("tbody").css("tr").each do |row|
            rank = row.css("td").css("p")[0].text.gsub(/\s+/, " ")
            name = row.css("td").css("p")[1].text.gsub(/\s+/, " ")
            city = row.css("td").css("p")[2].text.gsub(/\s+/, " ")
            completion = row.css("td").css("p")[3].text.gsub(/\s+/, " ")
            height_in_meters = row.css("td").css("p")[4].text.gsub(/\s+/, " ")
            height_in_feet = row.css("td").css("p")[6].text.gsub(/\s+/, " ")
            floors = row.css("td").css("p")[7].text.gsub(/\s+/, " ")
            material = row.css("td").css("p")[8].text.gsub(/\s+/, " ")
            function = row.css("td").css("p")[9].text.gsub(/\s+/, " ")
            TallestBuildingsTracker::Info.new(rank, name, city, completion, height_in_meters, height_in_feet, floors, material, function)
        end
    end
end

