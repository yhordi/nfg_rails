class Comment < ActiveRecord::Base
  belongs_to :post
  validates :name, :body, :post_id, :presence => true
end