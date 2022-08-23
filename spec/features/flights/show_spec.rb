require 'rails_helper'

RSpec.describe 'Flight show page' do
  it "shows flight with that ID, including attributes" do
    maui = Flight.create!(number: "707", airline: "United", destination: "Maui", international: false)
    nyc = Flight.create!(number: "423", airline: "Southwest", destination: "New York", international: false)
    columbus = Flight.create!(number: "890", airline: "American", destination: "Columbus", international: false)
    dc = Flight.create!(number: "398", airline: "Frontier", destination: "DC", international: false)
    cancun = Flight.create!(number: "524", airline: "Delta", destination: "Cancun", international: true)

    cindi = maui.passengers.create!(name: "Cindi", age: "63", gold_status: true)
    harry = maui.passengers.create!(name: "Harry", age: "35", gold_status: false)
    larry = nyc.passengers.create!(name: "Larry", age: "28", gold_status: true)
    mary = columbus.passengers.create!(name: "Mary", age: "18", gold_status: false)

    visit "/flights/#{maui.id}"

    expect(page).to have_content(707)
    expect(page).to have_content("United")
    expect(page).to have_content("Maui")
    expect(page).not_to have_content("cancun")
  end
end
