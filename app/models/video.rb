class Video < ActiveRecord::Base
  validates :link, :presence => true
end