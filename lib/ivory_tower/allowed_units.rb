module IvoryTower
  module AllowedUnits
    module ClassMethods
      def allows(*unit_types) 
        define_method :allowed_unit_types do
          unit_types
        end

        define_method :allows? do |unit_type|
          allowed_unit_types.include?(unit_type)
        end
      end
    end

    def self.included(base)
      base.extend(ClassMethods)
    end

    def <<(monster)
      monster.location = location
      occupants << monster

      self
    end

    def occupants
      @occupants ||= []
    end

    def occupied?
      !occupants.empty?
    end
  end
end
