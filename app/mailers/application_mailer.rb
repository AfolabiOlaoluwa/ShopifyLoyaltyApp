# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  layout 'mailer'

  default from: ENV['SYSTEM_MAIL_FROM'] # From Shop Domain will be better since lots of people will use it.

  def append_customer_details(email_or_instance)
    customer_detail = if email_or_instance.is_a?(CustomerDetail)
                        email_or_instance
                      else
                        CustomerDetail.find_by(email: email_or_instance)
                      end
    @customer_first_name = customer_detail.pick(:first_name) || ''
  end
end
