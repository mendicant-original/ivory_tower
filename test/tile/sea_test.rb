require_relative "../test_helper"

context "An IvoryTower::Sea object" do
  include AllowedUnits::TestHelpers

  test "should initially be unoccupied" do
    sea = IvoryTower::Tile.sea
    refute sea.occupied?
  end

  test "should allow sea units" do
    sea = IvoryTower::Tile.sea

    assert_allows_units(sea, :sea_units)
  end

  test "should not allow towers" do
    sea = IvoryTower::Tile.sea

    refute_allows_towers(sea)
  end
end 
