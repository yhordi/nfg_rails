class ApiResponse < ActiveRecord::Base
  validates :body, uniqueness: true
end
