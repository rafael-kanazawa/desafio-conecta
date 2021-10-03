class StockTransactionSerializer < ActiveModel::Serializer
  attributes :id, :quantity, :action
  has_one :stock
end
