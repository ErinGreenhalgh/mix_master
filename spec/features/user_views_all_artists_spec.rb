require 'rails_helper'

RSpec.feature "Uses sees all artists" do

  scenario "they see the page that displays all the artists" do

    artist1 = Artist.create(name: "Sade", image_path: "www.example.com")
    artist2 = Artist.create(name: "Sting", image_path: "www.example.com")

    visit artists_path

    expect(page).to have_content(artist1.name)
    expect(page).to have_content(artist2.name)

    click_on artist1.name
    expect(current_path).to eq artist_path(artist1.id)

    visit artists_path
    click_on artist2.name
    expect(current_path).to eq artist_path(artist2.id)
  end
end
