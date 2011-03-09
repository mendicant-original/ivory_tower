require_relative "test_helper"

context "An IvoryTower::Forest object" do
  include AllowedUnits::TestHelpers
  
  test "should initially be unoccupied" do
    forest = IvoryTower::Forest.new
    refute forest.occupied?
  end

  test "should allow air and ground units" do
    forest = IvoryTower::Forest.new

    assert_allows_units(forest, :air_units, :ground_units)
  end

  test "should allow towers" do
    forest = IvoryTower::Forest.new

    assert_allows_towers(forest)
  end
end 
