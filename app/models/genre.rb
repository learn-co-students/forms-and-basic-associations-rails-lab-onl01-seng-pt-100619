class Genre < ActiveRecord::Base
  # add associations
  belongs_to :song
  validates :name, presence: true 
  
end
