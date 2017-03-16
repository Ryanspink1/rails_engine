class MerchantRevenueSerializer < ActiveModel::Serializer
  attributes :revenue

  def revenue
    dollars = (object[:revenue].to_f / 100).to_s
    two_decimals(dollars)
  end

  def two_decimals(dollars)
    '%.2f' % dollars
  end
end
