# frozen_string_literal: true

FactoryBot.define do
  factory :administrator do
    name { 'Sr. Admin' }
    email { 'admin@runahr.com' }
    password { '12345678' }
  end
end
