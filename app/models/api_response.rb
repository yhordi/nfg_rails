class ApiResponse < ActiveRecord::Base
  validates :body, uniqueness: true, presence: true
  validates :name, uniqueness: true, presence: true
end
