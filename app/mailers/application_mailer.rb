# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  layout 'mailer'

  default from: ENV['SYSTEM_MAIL_FROM']

  def append_customer_details(email_or_instance)
    customer_detail = email_or_instance.is_a?(CustomerDetail) ? email_or_instance : CustomerDetail.find_by(email: email_or_instance)
    @customer_first_name = customer_detail.first_name || ''
  end
end
