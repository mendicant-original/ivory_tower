module IvoryTower
  module AllowedUnits
    def allows(*unit_types) 
      define_method :allowed_unit_types do
        unit_types
      end

      define_method :allows? do |unit_type|
        allowed_unit_types.include?(unit_type)
      end
    end
  end
end
