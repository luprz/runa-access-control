# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { 'admin@runahr.com' }
    password { '12345678' }
    role { :administrator }

    trait :employee do
      role { :employee }
    end

    trait :admin do
      role { :administrator }
    end
  end
end
