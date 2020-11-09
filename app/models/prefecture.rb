class Prefecture < ApplicationRecord
    has_many :shops
    has_many :cities
    validates :name, presence: true, length: { maximum: 50 }
end
