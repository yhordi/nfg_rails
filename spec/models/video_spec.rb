require 'rails_helper'

describe Video do
  it { should validate_presence_of :link}
end