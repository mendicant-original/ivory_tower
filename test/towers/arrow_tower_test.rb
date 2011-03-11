require_relative "../test_helper"

context "An IvoryTower::ArrowTower object" do
  test "Should only be ready to fire on every third tick" do
    assert_fire_on_tick 0,3,6,9
    refute_fire_on_tick 1,2,4,5,7,8
  end

  test "Should not fire when not ready" do
    tower = new_tower
    tower.expects(:target).never
    tower.fire(tick: 1)
  end

  test "Should fire when ready" do
    tower = new_tower
    enemy = mock("Monster", :defend_against => tower)

    tower.expects(:target_monster => enemy)

    tower.fire(tick: 3)
  end

  test "Should target a random monster in an occupied tile within range" do
    tower = new_tower   

    monster1 = stub("Monster 1")
    monster2 = stub("Monster 2")

    expected_monsters = [monster1, monster2]

    # I've had philosophical arguments about testing randomized input a number
    # of times before and normally favor just mocking out the random compenents.
    # Just for fun, trying something different here.
   
    1000.times do
      tower.expects(:target_tile => mock(:occupants => [monster1, monster2]))
      expected_monsters -= [tower.target_monster]

      return if expected_monsters.empty?
    end

    # This probably won't be run in our lifetime... if it does, 
    # suspect a bug or a bad test.
    flunk "BLACK SWAN! YOU WIN!"
  end

  test "TODO: verify behavior of target_tile"

  def new_tower
    IvoryTower::Towers::ArrowTower.new(mock("map"))
  end

  def assert_fire_on_tick(*ticks)
    ticks.each do |tick|
      ready = IvoryTower::Towers::ArrowTower.new(mock("Map")).fire_on_tick?(tick)
      assert ready, "Should fire on tick #{tick}"
    end
  end

  def refute_fire_on_tick(*ticks)
    ticks.each do |tick|
      ready = IvoryTower::Towers::ArrowTower.new(mock("Map")).fire_on_tick?(tick)
      refute ready, "Shouldn't fire on tick #{tick}"
    end
  end
end
