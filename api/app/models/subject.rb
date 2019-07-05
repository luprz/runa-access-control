# frozen_string_literal: true

# Subject model
class Subject < ApplicationRecord
  belongs_to :administrator
  belongs_to :employee
end
