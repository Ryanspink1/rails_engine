class Customer < ApplicationRecord
  validates :first_name, :last_name, presence: true
  has_many :invoices
  has_many :merchants, through: :invoices
  has_many :transactions, through: :invoices
  has_many :invoice_items, through: :invoices


  def favorite_merchant
    merchants.joins(:invoices, :transactions).merge(Transaction.successful).select("merchants.id, name, count(invoices.id) AS count_of_invoices").group("merchants.id").order("count_of_invoices DESC").first
  end






end
