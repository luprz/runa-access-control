require 'rails_helper'

RSpec.describe User, type: :model do
  context 'database' do
    context 'columns' do
      it { should have_db_column(:email).of_type(:string) }
      it { should have_db_column(:access_token).of_type(:string) }
    end
  end
end
