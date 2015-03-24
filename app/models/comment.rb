class Comment < ActiveRecord::Base
  belongs_to :commentable, :polymorphic => true
  validates :name, :body, :presence => true
end