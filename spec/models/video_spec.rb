require 'rails_helper'

describe Video do
  it { should validate_presence_of :link }
  it { should validate_uniqueness_of :link }
end