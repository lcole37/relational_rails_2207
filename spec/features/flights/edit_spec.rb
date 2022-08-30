require 'rails_helper'

RSpec.describe "the Flight edit" do
  before :each do
    Passenger.destroy_all
    Flight.destroy_all
  end

  it "links to the edit page" do
    flight = Flight.create!(number: "707", airline: "United", destination: "Maui", international: false)

    visit '/flights'

    click_button "Edit #{flight.number}"

    expect(current_path).to eq("/flights/#{flight.id}/edit")
  end

  it "can edit the flight" do
    flight = Flight.create!(number: "707", airline: "United", destination: "Mau", international: false)

    visit "/flights"

    # save_and_open_page
    expect(page).to have_content("Mau")
    click_button "Edit 707"

    fill_in 'Destination', with: 'Maui'
    click_button 'Update Flight'

    expect(current_path).to eq("/flights")
    expect(page).to have_content("Maui")
  end
end
