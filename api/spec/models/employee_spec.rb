# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Employee, type: :model do
  context 'associations' do
    it { have_many(:subjects) }
    it { have_many(:adminstrators) }
    it { have_many(:operations) }
  end

  describe '#status' do
    let(:user) { create(:administrator) }
    let(:employee) { create(:employee) }

    context 'when the user does not have operations' do
      it 'successfully' do
        expect(employee.status).to eq('out')
      end
    end

    context "When the user's last operation was out" do
      before do
        create(:operation, :out, employee_id: employee.id,
                                 administrator_id: user.id)
      end

      it 'successfully' do
        expect(employee.status).to eq('out')
      end
    end

    context "When the user's last operation was in" do
      before do
        create(:operation, :in, employee_id: employee.id,
                                administrator_id: user.id)
      end

      it 'successfully' do
        expect(employee.status).to eq('in')
      end
    end
  end

  describe '#chack_date' do
    let(:user) { create(:administrator) }
    let(:employee) { create(:employee) }

    context 'when the user does not have operations' do
      it 'successfully' do
        expect(employee.check_date).to eq(nil)
      end
    end

    context "When the user's last operation was out" do
      before do
        create(:operation, :out, employee_id: employee.id,
                                 administrator_id: user.id)
      end

      it 'successfully' do
        expect(employee.status).to be_a(String)
      end
    end

    context "When the user's last operation was in" do
      before do
        create(:operation, :in, employee_id: employee.id,
                                administrator_id: user.id)
      end

      it 'successfully' do
        expect(employee.status).to be_a(String)
      end
    end
  end
end
