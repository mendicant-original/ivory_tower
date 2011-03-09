require_relative "test_helper"

context "An IvoryTower::Mountain object" do
  include AllowedUnits::TestHelpers

  test "should initially be unoccupied" do
    mountain = IvoryTower::Mountain.new
    refute mountain.occupied?
  end

  test "should allow air units" do
    mountain = IvoryTower::Mountain.new

    assert_allows_units(mountain, :air_units)
  end

  test "should not allow towers" do
    mountain = IvoryTower::Mountain.new

    refute_allows_towers(mountain)
  end
end 
