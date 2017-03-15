class Item < ApplicationRecord
  validates :name, :description, :unit_price, :merchant_id, :created_at, :updated_at, presence: true
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items


  def best_day(params)
    byebug
  end
end
