class Category < ApplicationRecord
    belongs_to :user
    has_many :payments
    
    def total_transaction_amount
        payments.sum(:amount)
      end
end