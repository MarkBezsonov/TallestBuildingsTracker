class TallestBuildingsTracker::Building
    attr_accessor :name_v, :rank_v, :info
    @@all = []

    def initialize(name=nil, rank=nil)
        @name = name
        @rank = rank
        @info = []
    end

    def self.new(rank, name)
        @rank = rank
        @name = name
        @@all << self
    end

    def self.all
        TallestBuildingsTracker::Scraper.scrape_buildings if @@all.empty?
        @@all
    end

    def get_info
        TallestBuildingsTracker::Scraper.scrape_info(self) if @info.empty?
    end

    def save
        @@all << self
    end
end