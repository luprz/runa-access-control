# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ControlPolicy, type: :policy do
  let(:user) { create(user_assign) }
  subject { described_class.new(user: user) }

  describe '#initialize' do
    let(:user_assign) { :administrator }

    it 'assign user' do
      expect(subject.user).to equal(user)
    end
  end

  describe '#index?' do
    context 'when a user is admin' do
      let(:user_assign) { :administrator }

      it 'return true' do
        expect(subject.index?).to equal(true)
      end
    end

    context 'when a user is not admin' do
      let(:user_assign) { :employee }

      it 'raise pundit exception' do
        expect { subject.index? }
          .to raise_exception(Pundit::NotAuthorizedError)
      end
    end
  end
end
