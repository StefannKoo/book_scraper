class Platform < ApplicationRecord
   # has_and_belongs_to_many :books
    has_many :platform_books ,dependent: :destroy
    has_many :books, through: :platform_books
    belongs_to :territory
    has_many :publisher_platform,dependent: :destroy
    has_many :publishers, through: :publisher_platform
    has_one_attached :logo
    validates :name, :code, :logo, presence:true
   # validates :code, length: { minimum: 8 }
end
