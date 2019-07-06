# frozen_string_literal: true

# Operation json api serializer
class OperationSerializer < ActiveModel::Serializer
  attributes :id, :status, :note, :created_at
  belongs_to :employee
end
