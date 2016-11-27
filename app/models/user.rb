class User < ApplicationRecord
  has_many :transactions, dependent: :destroy
  has_many :documents, dependent: :destroy
end
