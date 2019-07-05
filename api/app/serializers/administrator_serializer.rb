# frozen_string_literal: true

# User json api serializer
class AdministratorSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :position
  has_many :employees
end
