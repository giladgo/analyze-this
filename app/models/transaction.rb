class Transaction < ApplicationRecord
  include ActiveModel::Serializers::JSON

  belongs_to :user
  belongs_to :merchant
end
