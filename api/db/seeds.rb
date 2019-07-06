# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Administrator.create(name: 'Sr. Admin', email: 'admin@admin.com', position: 'RRHH', password: '12345678')

Employee.create(name: 'Sr. Employee', email: 'Employee@Employee.com', position: 'Obrero', password: '12345678')