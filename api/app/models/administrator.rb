# frozen_string_literal: true

# Administrator model
class Administrator < User
  has_many :subjects
  has_many :employees, through: :subjects
end
