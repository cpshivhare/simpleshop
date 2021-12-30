class User < ApplicationRecord
  rolify

  devise :database_authenticatable,
         :jwt_authenticatable,
         :registerable,
         :validatable,
         jwt_revocation_strategy: JwtDenylist

  has_many :shipping_addresses, dependent: :destroy
  has_one :default_shipping_address, -> {  where(default: true) },
          class_name: 'ShippingAddress'

  has_many :orders, dependent: :destroy
  has_one :current_inprogress_order, -> { where(status: statuses[:inprogress]) }, class_name: 'Order'

  after_create :assign_default_role

  def assign_default_role
    add_role(:customer) if roles.blank?
  end
end
