class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
  end

  def new
    @song = Song.new
   
  end

  def create
  artist = Artist.find_or_create_by(name: song_params[:artist_name])  
  @song = artist.songs.build(song_params)
   # binding.pry
  if @song.save
    redirect_to songs_path
  else
    render :new
  end
end


  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])

    @song.update(song_params)

    if @song.save
      redirect_to songs_path
    else
      render :edit
    end
  end

  

  private

  def song_params
    params.require(:song).permit(:artist_name, :genre_id, :title, [:content])
  end
end