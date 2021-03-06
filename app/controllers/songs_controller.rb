class SongsController < ApplicationController
  before_action :find_artist, only: [:new, :create]

  def new
    @song = @artist.songs.new
  end

  def create
    @song = @artist.songs.create(song_params)

    redirect_to song_path(@song)
  end

  def show
    @song = Song.find(params[:id])
  end

private

  def song_params
    params.require(:song).permit(:title)
  end

  def find_artist
    @artist = Artist.find(params[:artist_id])
  end
end
