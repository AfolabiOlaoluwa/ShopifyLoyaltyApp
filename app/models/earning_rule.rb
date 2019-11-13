# frozen_string_literal: true

class EarningRule < ApplicationRecord
  belongs_to :user
  has_many :customer_details

  validates :name, presence: true
  validates :point, presence: true
end
