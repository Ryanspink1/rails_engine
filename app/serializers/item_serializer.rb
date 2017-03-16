class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :unit_price, :merchant_id

  def unit_price
    dollars = (object.unit_price.to_f / 100).to_s
    two_decimals(dollars)
  end

  def two_decimals(dollars)
    '%.2f' % dollars
  end
  
end
