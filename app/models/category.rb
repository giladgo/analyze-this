class Category < ApplicationRecord
  has_many :merchants
	has_many :transactions, through: :merchants
end
