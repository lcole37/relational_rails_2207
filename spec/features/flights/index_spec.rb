require 'rails_helper'

RSpec.describe 'flight index page' do
  before :each do
    Passenger.destroy_all
    Flight.destroy_all
  end

  it 'has the name of each flight record in the system' do
    maui = Flight.create!(number: "707", airline: "United", destination: "Maui", international: false)
    nyc = Flight.create!(number: "423", airline: "Southwest", destination: "New York", international: false)
    columbus = Flight.create!(number: "890", airline: "American", destination: "Columbus", international: false)
    dc = Flight.create!(number: "398", airline: "Frontier", destination: "DC", international: false)
    cancun = Flight.create!(number: "524", airline: "Delta", destination: "Cancun", international: true)


    cindi = maui.passengers.create!(name: "Cindi", age: "63", gold_status: true)
    harry = maui.passengers.create!(name: "Harry", age: "35", gold_status: false)
    larry = maui.passengers.create!(name: "Larry", age: "28", gold_status: true)
    mary = maui.passengers.create!(name: "Mary", age: "18", gold_status: false)

    visit '/flights'
    within "#flights-#{maui.id}" do
      expect(page).to have_content("707")
      expect(page).not_to have_content("180")
    end

    within "#flights-#{nyc.id}" do
      expect(page).to have_content("423")
      expect(page).not_to have_content("180")
    end

    within "#flights-#{columbus.id}" do
      expect(page).to have_content("890")
      expect(page).not_to have_content("180")
    end

    within "#flights-#{dc.id}" do
      expect(page).to have_content("398")
      expect(page).not_to have_content("180")
    end

    within "#flights-#{cancun.id}" do
      expect(page).to have_content("524")
      expect(page).not_to have_content("180")
    end
  end

  it 'displays the flights ordered by most recent' do
    maui = Flight.create!(number: "707", airline: "United", destination: "Maui", international: false, created_at: Time.now - 1.day)
    nyc = Flight.create!(number: "423", airline: "Southwest", destination: "New York", international: false, created_at: Time.now - 1.week)
    columbus = Flight.create!(number: "890", airline: "American", destination: "Columbus", international: false, created_at: Time.now)
    dc = Flight.create!(number: "398", airline: "Frontier", destination: "DC", international: false)
    cancun = Flight.create!(number: "524", airline: "Delta", destination: "Cancun", international: true)


    cindi = maui.passengers.create!(name: "Cindi", age: "63", gold_status: true)
    harry = maui.passengers.create!(name: "Harry", age: "35", gold_status: false)
    larry = maui.passengers.create!(name: "Larry", age: "28", gold_status: true)
    mary = maui.passengers.create!(name: "Mary", age: "18", gold_status: false)

    visit '/flights'
    # save_and_open_page

    expect("Columbus").to appear_before("Maui")
    expect("Maui").to appear_before("New York")
  end
end
