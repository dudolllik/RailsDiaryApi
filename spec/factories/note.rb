##require 'spec_helper'
FactoryBot.define do
  factory :note do
    text { Faker::Books::Lovecraft.paragraph }
    diary
  end
end