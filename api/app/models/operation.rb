# frozen_string_literal: true

# Operation model
class Operation < ApplicationRecord
  belongs_to :employee
  belongs_to :administrator
  enum status: %i[in out]
end
