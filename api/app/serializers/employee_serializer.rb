# frozen_string_literal: true

# Employee json api serializer
class EmployeeSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :position, :status
  has_many :administrators
  has_many :operations
end
