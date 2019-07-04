require 'rails_helper'

# frozen_string_literal: true

RSpec.describe User, type: :model do
  context 'database' do
    context 'columns' do
      it { should have_db_column(:name).of_type(:string) }
      it { should have_db_column(:email).of_type(:string) }
      it { should have_db_column(:encrypted_password).of_type(:string) }
      it { should have_db_column(:uid).of_type(:string) }
    end
  end
end
