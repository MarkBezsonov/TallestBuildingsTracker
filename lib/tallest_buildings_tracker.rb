require_relative "./tallest_buildings_tracker/version"
require_relative "./tallest_buildings_tracker/cli"
require_relative "./tallest_buildings_tracker/info"
require_relative "./tallest_buildings_tracker/scraper"
require_relative "./tallest_buildings_tracker/ascii_skyscraper_image"

require 'pry'
require 'nokogiri'
require 'open-uri'
require 'colorize'

module TallestBuildingsTracker
  class Error < StandardError; end
  # Your code goes here...
end