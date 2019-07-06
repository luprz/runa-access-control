# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Subject, type: :model do
  it { belong_to(:administrator) }
  it { belong_to(:employee) }

  describe 'validations' do
    context 'when it validates the presence of administrator_id' do
      it { validate_presence_of(:administrator_id) }
    end

    context 'when it validates the presence of employee_id' do
      it { validate_presence_of(:employee_id) }
    end
  end
end
