require 'yaml'

class Point

  @@US = YAML.load_file File.dirname(__FILE__) + "/edges.yml"

  attr_reader :lat, :lon

  def initialize(latitude = nil, longitude = nil)
    @lat = (latitude || (rand(0) * 180) - 90).round(2)
    @lon = (longitude || (rand(0) * 360) - 180).round(2)
  end

  def lat=(degrees)
    raise ArgumentError, "latitude is out of range" unless (-90..90).include?(degrees)  
    @lat = degrees.to_f.round(2)
  end

  def lon=(degrees)
    raise ArgumentError, "longitude is out of range" unless (-180..180).include(degrees)
    @lon = degrees.to_f.round(2)
  end

  def in_US?
    return false unless (25.1..49.4).include? lat
    @@US[lat] and @@US[lat].any? {|range| range.include? lon }
  end

end
