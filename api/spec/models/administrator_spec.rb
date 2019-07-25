# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Administrator, type: :model do
  context 'associations' do
    it { have_many(:subjects) }
    it { have_many(:employees) }
    it { have_many(:operations) }
  end

  describe 'delegate methods' do
    context '#register_in' do
      it do
        is_expected
          .to delegate_method(:register_in)
          .to(:checking)
      end
    end

    context '#register_out' do
      it do
        is_expected
          .to delegate_method(:register_out)
          .to(:checking)
      end
    end
  end

  describe '#add_employee' do
    context 'when assign an employee to administrator' do
      let(:admin) { create(:administrator) }
      let(:employee) { create(:employee) }

      it 'successfully' do
        expect(admin.add_employee(employee)).to eq(true)
      end
    end
  end
end
