# frozen_string_literal: true

class OrderPointsJob < ApplicationJob
  def perform(customer_email)
    customer_detail = CustomerDetail.find_by(email: customer_email)
    return unless customer_detail

    OrderPointsMailer.paid_order_email(customer_detail.id).deliver_later
  end
end
