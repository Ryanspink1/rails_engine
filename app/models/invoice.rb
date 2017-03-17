class Invoice < ApplicationRecord
  validates  :status, presence: true
  belongs_to :customer
  belongs_to :merchant
  has_many   :transactions
  has_many   :invoice_items
  has_many   :items, through: :invoice_items

  scope :pending, -> { where.not(id: Transaction.successful.pluck('DISTINCT invoice_id'))}
end
