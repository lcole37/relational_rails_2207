require 'rails_helper'

RSpec.describe  'As a visitor' do
  before :each do
    @flight = Flight.create!(number: 37, airline: "Luftanza", destination: "Prague", international: true)
    @passenger = @flight.passengers.create!(name: "Bob", age: 25, gold_status: true)
  end
  describe 'When I visit a Flight Pasenger Index page' do
    it 'I see a link to add a new passenger' do
      visit "/flights/#{@flight.id}/passengers"

      expect(page).to have_content("Bob")
      expect(page).not_to have_content("Paul")
      expect(page).to have_link("New Passenger")
    end
  end

  describe 'When I click the link' do
    it 'I am taken to a form to create a new passenger' do
      visit "/flights/#{@flight.id}/passengers"
      click_link("New Passenger")

      expect(current_path).to eq("/flights/#{@flight.id}/passengers/new")
      expect(page).to have_button("Create Passenger")
    end

    it 'form can create a new passenger on the flight passenger' do
      visit "/flights/#{@flight.id}/passengers/new"
      fill_in("Name", with: "Paul")
      fill_in("Age", with: 50)
      fill_in("Gold status", with: "true")
      click_button("Create Passenger")

      expect(current_path).to eq("/flights/#{@flight.id}/passengers")
      expect(page).to have_content("Paul")
    end
  end
end
