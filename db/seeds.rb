require 'csv'

InvoiceItem.destroy_all
Transaction.destroy_all
Invoice.destroy_all
Item.destroy_all
Merchant.destroy_all
Customer.destroy_all
#
CSV.foreach("./db/data/merchants.csv", :headers => true) do |row|
  Merchant.create!(row.to_hash)
end
puts "Merchants Seeded!"

CSV.foreach("./db/data/customers.csv", :headers => true) do |row|
  Customer.create!(row.to_hash)
end
puts "Customers Seeded!"

CSV.foreach("./db/data/items.csv", :headers => true) do |row|
  Item.create!(row.to_hash)
end
puts "Items Seeded!"

CSV.foreach("./db/data/invoices.csv", :headers => true) do |row|
  Invoice.create!(row.to_hash)
end
puts "Invoices Seeded!"

CSV.foreach("./db/data/invoice_items.csv", :headers => true) do |row|
  InvoiceItem.create!(row.to_hash)
end
puts "Invoice-Items Seeded!"

CSV.foreach("./db/data/transactions.csv", headers: true, header_converters: :symbol) do |row|
  Transaction.create!(invoice: Invoice.find(row[:invoice_id]),
                      credit_card_number: row[:credit_card_number],
                      result: row[:result],
                      created_at: row[:transaction_created],
                      updated_at: row[:transaction_updated],
                      )
end
puts "Transactions Seeded!"

puts "Seed complete!"
