class Publisher < ApplicationRecord
    has_many :books, dependent: :destroy
    has_many :scans, dependent: :destroy
    has_one_attached:photo
    has_many :publisher_platform ,dependent: :destroy
    has_many :platforms, through: :publisher_platform
    validates :name, :adress, presence: true
    validates :name, :adress, length:{minimum: 2}
    validates :name, uniqueness: {message:"The name must be unique !!"}
end
