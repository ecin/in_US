require 'minitest/spec'
require File.expand_path(File.dirname(__FILE__) + '/../lib/point')

MiniTest::Unit.autorun

describe Point do
  before do
    @runs = 1000000
  end

  describe "that's random" do
    it "should fall in the US about 1.5842% of the time" do
      inside = 0
      @runs.times do 
        inside += 1 if Point.new.in_US?
      end
      assert_in_delta 0.015842, inside/@runs.to_f, 0.001
    end
  end

end
