class Payment < ApplicationRecord
    belongs_to :author, class_name: "User"
    belongs_to :category
end