require 'rails_helper'

# frozen_string_literal: true

RSpec.describe Administrator, type: :model do
  context 'associations' do
    it { have_many(:subjects) }
    it { have_many(:employees) }
  end
end
