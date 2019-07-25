# frozen_string_literal: true

module Operations
  # Checking Service
  class Checking
    def initialize(admin:)
      @admin = admin
    end

    def register_in(employee, note)
      check('in', employee, note)
    end

    def register_out(employee, note)
      check('out', employee, note)
    end

    private

    def check(status, employee, note)
      Operation.create(
        status: status,
        note: note,
        employee_id: employee.id,
        administrator_id: @admin.id
      )
    end
  end
end
