class MerchantSerializer < ActiveModel::Serializer
  attributes :id, :name, :logo_url
  belongs_to :category
end
