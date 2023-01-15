class Audit < ApplicationRecord
  belongs_to :platform_book
  belongs_to :scan
  has_many :audit_prices, dependent: :destroy
  has_many :audit_actions, dependent: :destroy
end
