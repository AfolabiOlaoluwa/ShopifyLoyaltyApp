# frozen_string_literal: true

class OrderPointsMailer < ApplicationMailer
  def paid_order_email(customer_detail_id)
    append_recipient_details(customer_detail_id)
  end

  private

  def append_recipient_details(customer_detail_id)
    @customer_detail = CustomerDetail.find customer_detail_id
    append_customer_details(@customer_detail.pick(:email))
    mail subject: 'Congratulations',
         to: @customer_detail.pick(:email)
  end
end
