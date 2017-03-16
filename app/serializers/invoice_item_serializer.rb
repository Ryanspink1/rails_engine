class InvoiceItemSerializer < ActiveModel::Serializer
  attributes :id, :item_id, :invoice_id, :quantity, :unit_price

  def unit_price
    dollars = (object.unit_price.to_f / 100).to_s
    two_decimals(dollars)
  end

  def two_decimals(dollars)
    '%.2f' % dollars
  end
end
