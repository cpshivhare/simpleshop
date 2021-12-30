class ShippingAddressSerializer < ActiveModel::Serializer
  attributes :id, :address_1, :address_2, :zipcode, :state, :city, :country, :telephone

  belongs_to :user
end
