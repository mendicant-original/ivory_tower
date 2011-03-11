require_relative "../test_helper"

context "An IvoryTower::Forest object" do
  include AllowedUnits::TestHelpers
  
  test "should initially be unoccupied" do
    forest = IvoryTower::Tile.forest
    refute forest.occupied?
  end

  test "should allow air units" do
    forest = IvoryTower::Tile.forest

    assert_allows_units(forest, :air_units)
  end

  test "should allow towers" do
    forest = IvoryTower::Tile.forest

    assert_allows_towers(forest)
  end

  test "should start with no towers" do
    forest = IvoryTower::Tile.forest

    refute forest.tower
  end

  test "should be able have a tower built on it" do
    forest = IvoryTower::Tile.forest

    expected_tower = new_tower

    forest.build_tower(expected_tower)
    
    assert_equal expected_tower, forest.tower
  end

  test "should be able to destroy a tower once built" do
    forest = IvoryTower::Tile.forest

    forest.build_tower(new_tower)
    forest.destroy_tower

    refute forest.tower
  end

  test "should not be able to destroy a tower if none exists" do
    forest = IvoryTower::Tile.forest

    assert_raises(IvoryTower::Errors::TowerNotPresent) do
      forest.destroy_tower
    end
  end

  test "should not be able to build new a tower if one is present" do
    forest = IvoryTower::Tile.forest

    forest.build_tower(new_tower)

    assert_raises(IvoryTower::Errors::TowerPresent) do
      forest.build_tower(new_tower)
    end
  end

  def new_tower
    stub(:location= => nil)
  end
end 
