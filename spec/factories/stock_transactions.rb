FactoryBot.define do
  factory :stock_transaction do
    stock { nil }
    quantity { 1 }
    action { 1 }
  end
end
