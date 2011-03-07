module IvoryTower
  class RallyPoint
    extend AllowedUnits
    allows :ground_units, :sea_units, :air_units

    def initialize(name)
      @name      = name
      @occupants = []
    end

    attr_reader :name, :occupants

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

    def bar
      @name
    end
  end
end
