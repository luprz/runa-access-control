# frozen_string_literal: true

# Employee json api serializer
class EmployeeSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :position
  has_many :administrators
end
