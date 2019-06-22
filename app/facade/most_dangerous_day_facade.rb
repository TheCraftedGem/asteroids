class MostDangerousDayFacade
  attr_reader :fetch,
                      :start_date,
                      :end_date                     
  def initialize(params)
    @fetch           = Services::SimpleFetch.new(params) 
    @start_date  = Time.parse(params["start_date"]).strftime("%B %-d, %Y")
    @end_date    = Time.parse(params["end_date"]).strftime("%B %-d, %Y")
  end

  def service_call
    @fetch.days 
  end

  def generator
    service_call.map {|day| Day.new(day)}
  end

  def dangerous_days
    generator.map {|day| day.asteroids.keep_if {|asteroid|  asteroid.hazardous}}
  end

  def dangerous_day
    dangerous_days.sort_by { |asteroid| asteroid.size}.reverse.first
  end

  def date_range
    "#{@start_date} - #{@end_date}"
  end
  
end