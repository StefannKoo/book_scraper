class AuditAction < ApplicationRecord
  belongs_to :price
  belongs_to :audit_price
  belongs_to :audit
end
