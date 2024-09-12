class Client < ApplicationRecord
  has_many :memberships
  has_many :tenants, through: :memberships
  has_many :venues
  has_many :order_groups, dependent: :destroy
end
