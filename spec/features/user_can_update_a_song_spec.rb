require 'rails_helper'

RSpec.feature "user can update a song" do
  scenario "they edit song information" do
    artist = create(:artist)
    song = artist.songs.create(title: "My Song")
    new_title = "Don't Stop Believin"

    visit song_path(song)

    click_link "Edit"

    fill_in "Title", with: new_title
    find(:button, "Update Song").click

    expect(current_path).to eq song_path(song)
    expect(page).to have_content(new_title)
    expect(page).to have_link(artist.name, artist_path(artist))
  end
end
