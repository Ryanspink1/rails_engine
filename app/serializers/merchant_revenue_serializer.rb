class MerchantRevenueSerializer < ActiveModel::Serializer
  attributes :revenue

  def revenue
    (object[:revenue].to_f / 100).to_s
  end
end
