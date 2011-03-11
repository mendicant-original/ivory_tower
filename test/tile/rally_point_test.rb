require_relative "../test_helper"

context "An IvoryTower::RallyPoint object" do
  include AllowedUnits::TestHelpers

  test "should have a name" do
    rally_point = IvoryTower::Tile.rally_point("1")
    assert_equal "1", rally_point.name
  end

  test "should be empty initially" do
    rally_point = IvoryTower::Tile.rally_point("1")
    assert rally_point.empty?
  end

  test "should not be empty once occupants are added" do
    rally_point = IvoryTower::Tile.rally_point("1")
    rally_point << new_monster

    refute rally_point.empty?
  end

  test "should be able to remove an occupant" do
    rally_point = IvoryTower::Tile.rally_point("1")
    monster1    = new_monster    
    monster2    = new_monster

    rally_point << monster1 << monster2

    assert rally_point.occupants.include?(monster1)
    assert rally_point.occupants.include?(monster2)

    rally_point.delete(monster1)

    refute rally_point.occupants.include?(monster1)
    assert rally_point.occupants.include?(monster2)
  end

  test "should allow air, ground, and sea units" do
    rally_point = IvoryTower::Tile.rally_point("1")
    assert_allows_units rally_point, :air_units,
                                     :ground_units,
                                     :sea_units
  end

  test "should not allow towers" do
    rally_point = IvoryTower::Tile.rally_point("1")
    refute_allows_towers(rally_point)
  end

  # hack to be replaced later
  def new_monster
    mock(:location= => nil)
  end
end
