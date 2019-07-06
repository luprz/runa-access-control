require 'rails_helper'

# frozen_string_literal: true

RSpec.describe Administrator, type: :model do
  context 'associations' do
    it { have_many(:subjects) }
    it { have_many(:employees) }
  end

  describe '#register' do
    context 'when assign an employee to administrator' do
      let(:admin) { create(:administrator) }
      let(:employee) { create(:employee) }

      it 'successfully' do
        expect(admin.register(employee)).to eq(true)
      end
    end
  end
end
