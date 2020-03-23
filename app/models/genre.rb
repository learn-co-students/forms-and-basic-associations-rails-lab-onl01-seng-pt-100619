class Genre < ActiveRecord::Base
  # add associations
  belongs_to :songs
  
  
end
