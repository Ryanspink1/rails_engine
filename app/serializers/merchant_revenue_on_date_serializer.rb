class MerchantRevenueOnDateSerializer < ActiveModel::Serializer
  attributes :total_revenue

  def total_revenue
    (object[:total_revenue].to_f / 100).to_s
  end
end
