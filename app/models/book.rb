class Book < ApplicationRecord
    belongs_to :publisher
  # has_and_belongs_to_many :platforms, dependent: :destroy
    has_many :platform_books ,dependent: :destroy
    has_many :platforms, through: :platform_books
    has_one_attached :image
    validates :name, :date, :image, presence: true
    scope :have_ebook, ->{where(ebook:true)} #nisam stavljao vise scopes jer nisam imao neke konkretnije upite
end
