class Merchant < ApplicationRecord
  validates :name, presence: true
  has_many :items
  has_many :invoices
  has_many :invoice_items, through: :invoices
  has_many :transactions, through: :invoices
  has_many :customers, through: :invoices

  def total_revenue(date = nil)
    invoices.joins(:transactions, :invoice_items)
      .merge(Transaction.successful)
      .sum("invoice_items.quantity * invoice_items.unit_price")
  end

  def self.most_revenue(quantity)
    joins(:transactions, :invoice_items)
      .merge(Transaction.successful)
      .group('id')
      .order("sum(quantity * unit_price)DESC")
      .limit(quantity)
  end

end
