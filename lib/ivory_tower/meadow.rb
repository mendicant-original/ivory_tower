module IvoryTower
  class Meadow
    extend AllowedUnits
    allows :ground_units, :air_units

    def initialize
      @occupants = []
    end

    def occupied?
      !@occupants.empty?
    end
  end
end
