class TallestBuildingsTracker::Info
    attr_accessor :name_v, :rank_v :building_v, :info, :city_v, :completion_v, :height_in_meters_v, :height_in_feet_v, :floors_v, :material_v, :function_v
    @@all = []

    def initialize(name_v=nil, rank_v=nil, building_v=nil, city_v=nil, completion_v=nil, height_in_meters_v=nil, height_in_feet_v=nil, floors_v=nil, material_v=nil, function_v=nil)
        @name = name
        @rank = rank
        @building = building
        @city = city
        @completion = completion
        @height_in_meters = height_in_meters
        @height_in_feet = height_in_feet
        @floors = floors
        @material = material
        @function = function
        @info = []
        add_to_building
        save
    end

    def self.all
        @@all
    end

    def add_to_building
        @building.buildings << self unless @building.buildings.include?(self)
    end

    def get_building_info
        TallestBuildingsTracker::Scraper.scrape_info(self) if @info.empty?
    end

    def save
        @@all << self
    end
end