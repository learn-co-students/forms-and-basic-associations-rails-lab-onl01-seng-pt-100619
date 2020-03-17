class AddArtistNameToSongs < ActiveRecord::Migration[5.0]
  def change
    add_column :songs, :artist_name, :string
  end
end
