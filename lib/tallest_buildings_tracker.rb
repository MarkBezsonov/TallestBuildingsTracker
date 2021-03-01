require_relative "./tallest_buildings_tracker/version"
require_relative "./tallest_buildings_tracker/cli"
require_relative "./tallest_buildings_tracker/info"
require_relative "./tallest_buildings_tracker/scraper"

require 'pry'
require 'nokogiri'
require 'open-uri'

module TallestBuildingsTracker
  class Error < StandardError; end
  # Your code goes here...
end