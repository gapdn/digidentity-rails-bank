# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { FFaker::Internet.safe_email }
    password { FFaker::Internet.password }

    trait :with_account do
      after(:create) do |user|
        create(:account, user:)
      end
    end
  end
end
