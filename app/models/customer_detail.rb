class CustomerDetail < ApplicationRecord
  belongs_to :shop

  # scope :active, -> { where(email: 'true') }

end
