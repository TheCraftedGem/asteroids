class Day
  attr_reader :date,
                      :asteroids
  def initialize(day_info)
    binding.pry
    @date           =  day_info.first
    @asteroids   =  day_info.second.map do |asteroid|
                      Asteroid.new(asteroid)
                    end
  end
end