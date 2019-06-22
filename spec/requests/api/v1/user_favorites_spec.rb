require 'rails_helper'

describe "GET /user/favorites" do
  it "returns a users favorite asteroid" do
    user = create(:user, email: "uncle.jesse@example.com", name: "Jesse Katsopolis")
    api_key = create(api_key:'abc123')

    get '/api/v1/user/favorites?api_key=abc123'

    expect(response.status).to eq 200

    user = JSON.parse(response.body, symbolize_names: true)[:near_earth_objects]
  end
end