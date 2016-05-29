require 'rails_helper'

RSpec.feature 'user creates a song' do
  scenario 'they can create a song' do
    artist = create(:artist)
    song_title = "Roxanne"

    visit artist_path(artist)

    click_on "New Song"

    fill_in "Title", with: song_title
    find(:button, "Create Song").click

    expect(page).to have_content song_title
    expect(page).to have_link artist.name,  href: artist_path(artist)
  end
end
