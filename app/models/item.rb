class Item < ApplicationRecord
  validates :name, :description, :unit_price, :merchant_id, :created_at, :updated_at, presence: true
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items


  def best_day
    invoices.joins(:transactions, :invoice_items)
      .merge(Transaction
      .successful)
      .group('invoices.id')
      .order("sum(invoice_items.quantity)DESC")
      .first.created_at
  end

  def self.most_revenue(quantity)
    joins(:invoice_items).group('id').order("sum(invoice_items.quantity *invoice_items.unit_price) DESC").limit(quantity)
  end

  def self.most_items(quantity)
    joins(:invoice_items).group('id').order("sum(invoice_items.quantity) DESC").limit(quantity)
  end

end
