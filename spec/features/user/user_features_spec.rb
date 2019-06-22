require "rails_helper"

RSpec.describe 'visits most dangerous days page' do
  it "can see a list of days" do

  visit "/"
  
  within "form.date-search" do
    fill_in "start_date", with: "2018-01-01"
    fill_in "end_date", with: "2018-01-07" 
  end

  click_on "Determine Most Dangerous Day"
  
  expect(current_path).to eq(most_dangerous_day_path)
  
  expect(page).to have_content("Most Dangerous Day")
  expect(page).to have_content("January 1, 2018 - January 7, 2018")


    expect(page).to have_content("Name: (2014 KT76)")
    expect(page).to have_content("NEO Reference ID: 3672906")

    expect(page).to have_content("Name: (2001 LD)")
    expect(page).to have_content("NEO Reference ID: 3078262")

    expect(page).to have_content("Name: (2017 YR1)")
    expect(page).to have_content("NEO Reference ID: 3794979")

  end
end