require_relative "../test_helper"

context "An IvoryTower::Meadow object" do
  include AllowedUnits::TestHelpers

  test "should initially be unoccupied" do
    meadow = IvoryTower::Tile.meadow
    refute meadow.occupied?
  end

  test "should allow air and ground units" do
    meadow = IvoryTower::Tile.meadow

    assert_allows_units(meadow, :air_units, :ground_units)
  end

  test "should not allow towers" do
    meadow = IvoryTower::Tile.meadow

    refute_allows_towers(meadow)
  end
end 
