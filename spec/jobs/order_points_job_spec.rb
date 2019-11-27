# frozen_string_literal: true

require 'rails_helper'

RSpec.describe OrderPointsJob, type: :job do
  describe '#perform' do
    it 'enqueues email' do
      customer_detail = create(:customer_detail)

      ActiveJob::Base.queue_adapter = :test
      expect do
        OrderPointsJob.perform_now(customer_detail.email)
      end.to have_enqueued_job
    end
  end
end