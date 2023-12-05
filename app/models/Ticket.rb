class Ticket < ApplicationRecord
  has_and_belongs_to_many :users

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
end