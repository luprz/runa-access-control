# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Subject, type: :model do
  it { belong_to(:administrator) }
  it { belong_to(:employee) }
end
