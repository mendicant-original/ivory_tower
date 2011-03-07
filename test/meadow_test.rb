require_relative "test_helper"

context "An IvoryTower::Meadow object" do
  include AllowedUnits::TestHelpers

  test "should initially be unoccupied" do
    meadow = IvoryTower::Meadow.new
    refute meadow.occupied?
  end

  test "should allow air and ground units" do
    meadow = IvoryTower::Meadow.new

    assert_allows_units(meadow, :air_units, :ground_units)
  end
end 
