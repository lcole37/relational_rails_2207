require 'rails_helper'

RSpec.describe Passenger, type: :model do
  describe 'relationships' do
    it {should belong_to(:flight)}
  end
end
