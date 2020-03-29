class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
  end

  def new
    @song = Song.new
    5.times { @song.notes.build }
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

  def destroy
    @song = Song.find(params[:id])
    @song.destroy  
    redirect_to songs_path
  end

  private

  def song_params
    params.require(:song).permit(:title, :genre_id, :artist_name, notes_attributes: [:content])
  end
end

  # <%= f.fields_for :notes do |note_form| %>
  #   <%= note_form.label :note %>
  #   <%=  note_form.text_area :content, rows: 5, cols: 50  %>
  # <%= f.submit %>
  # <% end %>
  # <% end %>