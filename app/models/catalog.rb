class Catalog < ApplicationRecord
  has_many :links, dependent: :destroy
  validates :title, presence: true,
                    length: { minimum: 5 }
end
