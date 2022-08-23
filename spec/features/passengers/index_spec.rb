require 'rails_helper'

RSpec.describe "Passenger show page" do
  it 'has the name of each passenger and their attributes' do
    maui = Flight.create!(number: "707", airline: "United", destination: "Maui", international: false)
    nyc = Flight.create!(number: "423", airline: "Southwest", destination: "New York", international: false)
    columbus = Flight.create!(number: "890", airline: "American", destination: "Columbus", international: false)
    dc = Flight.create!(number: "398", airline: "Frontier", destination: "DC", international: false)
    cancun = Flight.create!(number: "524", airline: "Delta", destination: "Cancun", international: true)

    cindi = maui.passengers.create!(name: "Cindi", age: "63", gold_status: true)
    harry = maui.passengers.create!(name: "Harry", age: "35", gold_status: false)
    larry = maui.passengers.create!(name: "Larry", age: "28", gold_status: true)
    mary = maui.passengers.create!(name: "Mary", age: "18", gold_status: false)

    visit '/passengers'

    within "#passengers-#{cindi.id}" do
      expect(page).to have_content("Cindi")
      expect(page).to have_content("63")
      expect(page).to have_content("true")
      expect(page).not_to have_content("55")
    end

    within "#passengers-#{harry.id}" do
      expect(page).to have_content("Harry")
      expect(page).to have_content("35")
      expect(page).to have_content("false")
      expect(page).not_to have_content("55")
    end

    within "#passengers-#{larry.id}" do
      expect(page).to have_content("Larry")
      expect(page).to have_content("28")
      expect(page).to have_content("true")
      expect(page).not_to have_content("55")
    end

    within "#passengers-#{mary.id}" do
      expect(page).to have_content("Mary")
      expect(page).to have_content("18")
      expect(page).to have_content("false")
      expect(page).not_to have_content("55")
    end
  end
end