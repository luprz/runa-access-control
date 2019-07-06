# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AdministratorPolicy, type: :policy do
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

  describe '#create?' do
    context 'when a user is admin' do
      let(:user_assign) { :administrator }

      it 'return true' do
        expect(subject.create?).to equal(true)
      end
    end

    context 'when a user is not admin' do
      let(:user_assign) { :employee }

      it 'raise pundit exception' do
        expect { subject.create? }
          .to raise_exception(Pundit::NotAuthorizedError)
      end
    end
  end

  describe '#show?' do
    context 'when a user is admin' do
      let(:user_assign) { :administrator }

      it 'return true' do
        expect(subject.show?).to equal(true)
      end
    end

    context 'when a user is not admin' do
      let(:user_assign) { :employee }

      it 'raise pundit exception' do
        expect { subject.show? }
          .to raise_exception(Pundit::NotAuthorizedError)
      end
    end
  end

  describe '#update?' do
    context 'when a user is admin' do
      let(:user_assign) { :administrator }

      it 'return true' do
        expect(subject.update?).to equal(true)
      end
    end

    context 'when a user is not admin' do
      let(:user_assign) { :employee }

      it 'raise pundit exception' do
        expect { subject.update? }
          .to raise_exception(Pundit::NotAuthorizedError)
      end
    end
  end

  describe '#destroy?' do
    context 'when a user is admin' do
      let(:user_assign) { :administrator }

      it 'return true' do
        expect(subject.destroy?).to equal(true)
      end
    end

    context 'when a user is not admin' do
      let(:user_assign) { :employee }

      it 'raise pundit exception' do
        expect { subject.destroy? }
          .to raise_exception(Pundit::NotAuthorizedError)
      end
    end
  end
end
