require 'rails_helper'

RSpec.feature "user edits a playlist" do
  scenario 'they can edit the playlist' do
    playlist = create(:playlist)
    song1 = playlist.songs.create(title: "Title1")
    song2 = playlist.songs.create(title: "Title2")

    new_song = create(:song)
    new_name = "Updated Great Name"

    visit playlist_path(playlist)

    click_on "Edit"

    fill_in "Name", with: new_name
    check("song-#{new_song.id}")
    uncheck("song-#{song1.id}")

    find(:button, "Update Playlist").click

    expect(current_path).to eq playlist_path(playlist)

    within("h1") do
      expect(page).to have_content(new_name)
    end

    within("ul") do
      expect(page).to have_content(new_song.title)
      expect(page).not_to have_content(song1.title)
    end
  end
end
