# frozen_string_literal: true

# User json api serializer
class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :name
end
