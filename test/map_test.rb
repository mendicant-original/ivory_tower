require_relative "test_helper"
require "pp"

trivial_map = <<-END_MAP
##**##
A....$
##**##
END_MAP

context "Map" do
  test "#from_string" do
    map = IvoryTower::Map.from_string(trivial_map, base_health: 10)

    assert map.base.health, 10
    assert [1,5], map.base.location
    
    assert 4, map.forests.count
    assert 1, map.rally_points.count

    assert "A", map.rally_points["A"].name
  end

  test "#from_file" do
    file = "#{File.dirname(__FILE__)}/fixtures/trivial_map.txt"
    map = IvoryTower::Map.from_file(file, base_health: 10) 

    assert map.base.health, 10
    assert [1,5], map.base.location
    
    assert 4, map.forests.count
    assert 1, map.rally_points.count
  end
end


