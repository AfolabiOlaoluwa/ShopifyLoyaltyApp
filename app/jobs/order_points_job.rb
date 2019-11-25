# frozen_string_literal: true

class OrderPointsJob < ApplicationJob
  queue_as :mailer

  # def perform_now(customer_email)
  def send_mail(customer_email)
    binding.pry
    customer_detail = CustomerDetail.find_by(email: customer_email)
    return unless customer_detail

    OrderPointsMailer.paid_order_email(customer_detail.id)
  end
end
