# frozen_string_literal: true

# Employee model
class Employee < User
  has_many :subjects
  has_many :administrators, through: :subjects
end
