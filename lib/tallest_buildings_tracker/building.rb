class TallestBuildingsTracker::Building
    attr_accessor :name, :info
    @@all = []

    def initialize(name=nil)
        @name = name
        save
    end

    def self.info
        @info = []
    end

    def self.all
        TallestBuildingsTracker::Scraper.scrape_buildings if @@all.empty?
        @@all
    end

    def get_info
        TallestBuildingsTracker::Scraper.scrape_info(self) if TallestBuildingsTracker::Building.info.empty?
        TallestBuildingsTracker::Building.info << self
    end

    def save
        @@all << self
    end
end