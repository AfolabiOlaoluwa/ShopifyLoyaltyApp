# frozen_string_literal: true

class OrderPointsJob < ApplicationJob
  queue_as :mailer

  def perform(customer_email)
    customer_detail = CustomerDetail.find_by_email(eamil: customer_email)
    return unless customer_detail

    OrderPointsMailer.paid_order_email(customer_detail.id)
  end
end
