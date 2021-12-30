class ShippingAddress < ApplicationRecord
  belongs_to :user

  validates :address_1, presence: true
  validates :zipcode, presence: true
  validates :country, presence: true
  validates :state, presence: true
  validates :city, presence: true
  validates :telephone, presence: true
end
