class Payment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :category

  validates :name, presence: true, length: { maximum: 50 }
  validates :amount, presence: true, numericality: { greater_than: 0, only_integer: true }
end
