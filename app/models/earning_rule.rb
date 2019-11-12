class EarningRule < ApplicationRecord
  has_many :customer_details

  validates :name, presence: true
  validates :point, presence: true
  # validates :status, presence: true
end
