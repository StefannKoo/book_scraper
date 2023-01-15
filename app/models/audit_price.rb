class AuditPrice < ApplicationRecord
  belongs_to :audit
  has_many :audit_actions, dependent: :destroy
end
