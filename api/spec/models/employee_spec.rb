# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Employee, type: :model do
  context 'associations' do
    it { have_many(:subjects) }
    it { have_many(:adminstrators) }
    it { have_many(:operations) }
  end

  describe '#check_toggle' do
    let(:user) { create(:administrator) }
    let(:employee) { create(:employee) }

    context 'when the user does not have operations' do
      it 'successfully' do
        check_obj = employee.check_toggle(admin_id: user.id, note: nil)
        expect(check_obj.status).to eq('in')
      end
    end

    context "When the user's last operation was out" do
      before do
        create(:operation, :out, employee_id: employee.id,
                                 administrator_id: user.id)
      end

      it 'successfully' do
        check_obj = employee.check_toggle(admin_id: user.id, note: nil)
        expect(check_obj.status).to eq('in')
      end
    end

    context "When the user's last operation was in" do
      before do
        create(:operation, :in, employee_id: employee.id,
                                administrator_id: user.id)
      end

      it 'successfully' do
        check_obj = employee.check_toggle(admin_id: user.id, note: nil)
        expect(check_obj.status).to eq('out')
      end
    end
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
end
