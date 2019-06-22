class Asteroid 
  attr_reader :neo_id,
                      :name,
                      :hazardous
  def initialize(asteroid_data)
    
    @name          = asteroid_data[:name]
    @neo_id        = asteroid_data[:neo_reference_id]
    @hazardous = asteroid_data[:is_potentially_hazardous_asteroid]
  end
end