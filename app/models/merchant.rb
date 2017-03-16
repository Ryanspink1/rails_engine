class Merchant < ApplicationRecord
  validates :name, presence: true
  has_many :items
  has_many :invoices
  has_many :invoice_items, through: :invoices
  has_many :transactions, through: :invoices
  has_many :customers, through: :invoices

  def total_revenue(date = nil)
    return total_revenue_by_date(date) if date

    invoices.joins(:transactions, :invoice_items)
      .merge(Transaction.successful)
      .sum("invoice_items.quantity * invoice_items.unit_price")
  end

  def total_revenue_by_date(date)
    invoices.joins(:transactions, :invoice_items)
      .merge(Transaction.successful)
      .where(invoices: {created_at: date} )
      .sum("invoice_items.quantity * invoice_items.unit_price")
  end

  # def self.most_revenue(quantity)
  #   joins(:transactions, :invoice_items)
  #     .merge(Transaction.successful)
  #     .group('id')
  #     .order("sum(quantity * unit_price)DESC")
  #     .limit(quantity)
  # end
  def self.most_revenue(quantity)
      joins(:invoice_items)
      .group('id')
      .order("sum(invoice_items.quantity * invoice_items.unit_price) DESC")
      .limit(quantity)
  end

  def favorite_customer
    customers.joins(:invoices, :transactions)
      .merge(Transaction.successful)
      .select("customers.id, first_name, last_name, count(invoices.id) AS count_of_invoices")
      .group("customers.id")
      .order("count_of_invoices DESC")
      .first
  end

  def self.most_items(quantity)
    joins(invoices: [:invoice_items, :transactions]).merge(Transaction.successful).group('id').order("sum(invoice_items.quantity) DESC").limit(8)
  end

  def self.revenue(date)
    joins(:invoice_items).where(invoices: {created_at: date}).sum("invoice_items.quantity * invoice_items.unit_price")
  end
end
