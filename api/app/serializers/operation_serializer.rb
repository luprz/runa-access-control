# frozen_string_literal: true

# Operation json api serializer
class OperationSerializer < ActiveModel::Serializer
  attributes :id, :status, :note, :created_at,
             :employee_id, :employee_name,
             :employee_position
  belongs_to :employee
  belongs_to :administrator

  def employee_id
    object.employee.id
  end

  def employee_name
    object.employee.name
  end

  def employee_position
    object.employee.position
  end
end
