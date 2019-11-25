# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EarningRulePresenter do
  subject { EarningRulePresenter.new(earning_rule, earning_rule) }

  describe '#name' do
    let(:earning_rule) { double(name: 'Order') }

    it 'returns Name' do
      expect(subject.name).to eq earning_rule.name
    end
  end

  describe '#point' do
    let(:earning_rule) { double(point: 5) }

    it 'return Last Name' do
      expect(subject.point).to eq earning_rule.point
    end
  end

  describe '#status' do
    let(:earning_rule) { double(status: true) }

    it 'return Status' do
      expect(subject.status).to eq earning_rule.status
    end
  end
end