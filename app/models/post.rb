class Post < ActiveRecord::Base
  validates :title, :body, :author, presence: true
  has_many :comments, as: :commentable
end