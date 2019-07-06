# frozen_string_literal: true

# Subject model
class Subject < ApplicationRecord
  belongs_to :administrator
  belongs_to :employee, dependent: :destroy

  validates_presence_of :administrator_id,
                        :employee_id
end
