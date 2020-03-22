class Song < ActiveRecord::Base
  has_many :notes

  belongs_to :artist
  belongs_to :genre

  
  
  # Lets us create multiple notes when creating a Song. 
  #However we can define a proc (a small in-line method) that is passed the attributes that are about to be
  #handed to the to-be-created Note and cancel the operation (reject_if) if they are judged
  # to be invalid (i.e. the content attribute is empty). 
  accepts_nested_attributes_for :notes, :reject_if => proc { |attrs| attrs[:content].blank? }

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    artist.try(:name) 
  end


end
