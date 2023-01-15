class Scan < ApplicationRecord
    has_many :audits ,dependent: :destroy
    has_many :platform_books, through: :audits
    belongs_to :publisher
end
