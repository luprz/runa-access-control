require 'rails_helper'

# frozen_string_literal: true

RSpec.describe Employee, type: :model do
  context 'associations' do
    it { have_many(:subjects) }
    it { have_many(:adminstrators) }
  end
end
