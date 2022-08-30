require 'rails_helper'

RSpec.describe 'Flight creation' do
  it "links to the new page from the flight index" do
    visit "/flights"

    click_link('New Flight')

    expect(current_path).to eq('/flights/new')
  end

  it 'can create a new flight' do
    visit '/flights/new'

    fill_in("Number", with: 500)
    fill_in("Destination", with: "Bora Bora")
    fill_in("International", with: "true")
    click_button("Create Flight")

    expect(current_path).to eq("/flights")
    expect(page).to have_content("Bora Bora")
  end
end
