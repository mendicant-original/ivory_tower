module IvoryTower
  class RallyPoint
    include AllowedUnits
    allows :ground_units, :sea_units, :air_units

    def initialize(name)
      @name      = name
    end

    attr_reader :name

    def <<(monster)
      occupants << monster

      self
    end

    def delete(monster)
      occupants.delete(monster)
    end

    def empty?
      occupants.empty?
    end
  end
end
