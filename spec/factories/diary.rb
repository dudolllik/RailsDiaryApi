##require 'spec_helper'
FactoryBot.define do
  factory :diary do
    title { Faker::Book.title }
    expiration { Faker::Date.forward(days: 10) }
    kind { rand(0..1) }
  end
end