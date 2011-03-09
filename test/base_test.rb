require_relative "test_helper"

context "An IvoryTower::Base object" do
  include AllowedUnits::TestHelpers

  test "should have an initial health" do
    base = IvoryTower::Base.new(10)
    assert_equal 10, base.health
  end

  test "should have its health reduced each time a monster is added" do
    base = IvoryTower::Base.new(10)

    base << new_monster
    assert_equal 9, base.health

    base << new_monster
    assert_equal 8, base.health
  end

  test "should be destroyed when health is reduced to zero" do
    base = IvoryTower::Base.new(1)

    base << new_monster
    assert base.destroyed?
  end

  test "should not be destroyed when health is positive" do
    base = IvoryTower::Base.new(2)

    refute base.destroyed?

    base << new_monster

    refute base.destroyed?
  end

  test "should allow air, ground, and sea units" do
    base = IvoryTower::Base.new(10)

    assert_allows_units(base, :air_units, :ground_units, :sea_units)
  end

  test "should not allow towers" do
    base = IvoryTower::Base.new(10)

    refute_allows_towers(base)
  end

  # hack to replace later
  def new_monster
    Object.new
  end
end
