FactoryBot.define do
  factory :product do
    name { "MyString" }
    description { "MyString" }
    price { 1.5 }
    stock { nil }
  end
end
