class Transaction < ApplicationRecord
  include ActiveModel::Serializers::JSON

  belongs_to :user
  belongs_to :merchant
  belongs_to :document
end
