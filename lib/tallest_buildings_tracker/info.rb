class TallestBuildingsTracker::Info
    attr_accessor :name, :rank, :building, :info, :city, :completion, :height_in_meters, :height_in_feet, :floors, :material, :function
    @@all = []

    def initialize(city, completion, height_in_meters, height_in_feet, floors, material, function)
        @city = city
        @completion = completion
        @height_in_meters = height_in_meters
        @height_in_feet = height_in_feet
        @floors = floors
        @material = material
        @function = function
        add_to_building
        save
    end
#EXPERIMENTAL START
    def self.name
        name = []
    end

    def self.building
        building = []
    end

    def self.city
        city = []
    end

    def self.completion
        completion = []
    end

    def self.height_in_meters
        height_in_meters  = []
    end

    def self.height_in_feet
        height_in_feet = []
    end

    def self.floors
        floors = []
    end

    def self.material
        material = []
    end    

    def self.function
        function = []
    end  
#EXPERIMENTAL END
    def self.all
        @@all
    end

    def self.info
        TallestBuildingsTracker::Building.info
    end

    def add_to_building
        TallestBuildingsTracker::Building.info << self unless TallestBuildingsTracker::Building.info.include?(self)
    end

    def get_building_info
        TallestBuildingsTracker::Scraper.scrape_info(self) if @info.empty?
    end

    def save
        @@all << self
    end
end