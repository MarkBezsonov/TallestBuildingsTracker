class TallestBuildingsTracker::Info
    attr_accessor :rank, :name, :building, :info, :city, :completion, :height_in_meters, :height_in_feet, :floors, :material, :function
    @@all = []

    def initialize(rank, name, city, completion, height_in_meters, height_in_feet, floors, material, function)
        @rank = rank
        @name = name
        @city = city
        @completion = completion
        @height_in_meters = height_in_meters
        @height_in_feet = height_in_feet
        @floors = floors
        @material = material
        @function = function
        save
    end

    def self.all
        TallestBuildingsTracker::Scraper.scrape_info if @@all.empty?
        @@all
    end

    def save
        @@all << self
    end
end