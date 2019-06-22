class Services::SimpleFetch
  attr_reader :params
  def initialize(params)
    @params = params
  end

  def days
    response = Faraday.get("https://api.nasa.gov/neo/rest/v1/feed",  queries)
    JSON.parse(response.body, symbolize_names: true) [:near_earth_objects]
  end

  def  queries
    {
      start_date: @params[:start_date],
      end_date: @params[:end_date],
      api_key: "pwKh3YW5u7Fi4fk9Yq728ooPSFA9NCWgkq90DVOr",
      }
  end
end