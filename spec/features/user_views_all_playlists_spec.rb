require 'rails_helper'

RSpec.feature "user views all playlists" do
  scenario 'they see the list of playlists' do
    playlist1, playlist2, playlist3 = create_list(:playlist, 3 )

    visit playlists_path

    within("li:first") do
        expect(page).to have_link(playlist1.name, href: playlist_path(playlist1))
    end

    within("li:nth-child(2)") do
        expect(page).to have_link(playlist2.name, href: playlist_path(playlist2))
    end

    within("li:last") do
        expect(page).to have_link(playlist3.name, href: playlist_path(playlist3))
    end


  end



end
