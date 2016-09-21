class MerchantSerializer < ActiveModel::Serializer
  attributes :name, :logo_url
  belongs_to :category
end