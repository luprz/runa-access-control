# frozen_string_literal: true

# Administrator json api serializer
class AdministratorSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :position
  has_many :employees
  has_many :operations
end
