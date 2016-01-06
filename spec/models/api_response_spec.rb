require 'rails_helper'

RSpec.describe ApiResponse, :type => :model do
  it { should validate_uniqueness_of :body}
end
