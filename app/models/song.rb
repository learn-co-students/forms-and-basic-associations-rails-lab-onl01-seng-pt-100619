class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre 
  has_many :notes

  accepts_nested_attributes_for :notes, reject_if: proc { |attributes| attributes[:content].blank? }

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    artist.try(:name)
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    artist.try(:name)
  end

end
