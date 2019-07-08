# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin = Administrator.create(name: 'Sr. Admin', email: 'admin@admin.com', position: 'RRHH', password: '12345678')

employee = Employee.create(name: 'Sr. Employee', email: 'employee@employee.com', position: 'Supervisor', password: '12345678')

Subject.create(administrator_id: admin.id, employee_id: employee.id)