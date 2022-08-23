require 'rails_helper'

RSpec.describe 'flight index page' do
  it 'has the name of each flight record in the system' do
    maui = Flight.create!(number: "707", airline: "United" destination: "Maui", international?: false)
    nyc = Flight.create!(number: "423", airline: "Southwest" destination: "New York", international?: false)
    columbus = Flight.create!(number: "890", airline: "American" destination: "Columbus", international?: false)
    dc = Flight.create!(number: "398", airline: "Frontier" destination: "DC", international?: false)
    cancun = Flight.create!(number: "524", airline: "Delta" destination: "Cancun", international?: true)


    cindi = maui.passengers.create!(name: "Cindi", age: "63", gold_status?: true)
    harry = maui.passengers.create!(name: "Harry", age: "35", gold_status?: false)
    larry = maui.passengers.create!(name: "Larry", age: "28", gold_status?: true)
    mary = maui.passengers.create!(name: "Mary", age: "18", gold_status?: false)

    visit '/flights'

    expect(page).to have_content("707")
    expect(page).to have_content("423")
    expect(page).to have_content("890")
    expect(page).to have_content("398")
    expect(page).to have_content("524")
    expect(page).not_to have_content("180")
  end
end
