require 'rails_helper'

RSpec.feature "user deletes an artist" do
  scenario "user can delete an artist" do
    artist = Artist.create(name: "Sade", image_path: "www.example.com")

    visit artist_path(artist.id)
    click_link "Delete"

    expect(current_path).to eq artists_path
    expect(page).not_to have_content("Sade")
  end
end
