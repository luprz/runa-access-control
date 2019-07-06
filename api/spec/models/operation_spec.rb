# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Operation, type: :model do
  context 'associations' do
    it { belong_to(:employee) }
    it { belong_to(:administrator) }
  end
end
