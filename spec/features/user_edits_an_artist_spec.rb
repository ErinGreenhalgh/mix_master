require 'rails_helper'

RSpec.feature "user edits an artist" do
  scenario "they can edit existing artist information" do
    artist = Artist.create(name: "Sade", image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")

    visit artist_path(artist.id)
    click_link "Edit"

    fill_in "artist_name", with: "The Police"
    find(:button, "Update Artist").click

    expect(current_path).to eq artist_path(artist.id)

    expect(page).to have_content("The Police")
    expect(page).not_to have_content("Sade")
    expect(page).to have_css("img[src=\"#{artist.image_path}\"]")
  end
end
