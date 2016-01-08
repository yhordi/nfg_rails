require 'rails_helper'

RSpec.describe ApiResponse, :type => :model do
  it { should validate_uniqueness_of :body }
  it { should validate_uniqueness_of :name }
  it { should validate_presence_of :body }
  it { should validate_presence_of :name }
end
