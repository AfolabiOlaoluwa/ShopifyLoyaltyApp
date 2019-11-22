# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Shop, type: :model do
  let(:subject) { build(:shop) }

  it 'is valid from the factory' do
    expect(subject).to be_valid
  end

  describe 'association' do
    it { is_expected.to have_many(:earning_rules) }
    it { is_expected.to have_many(:customer_details) }
  end

  describe '#api_version' do
    it 'defaults to nil if api_version is not set' do
      ShopifyApp.configuration.api_version = nil
      expect(ShopifyApp.configuration.api_version).to eq nil
    end

    it 'defaults shop integration to listed api version if set' do
      ShopifyApp.configuration.api_version = '2019-10'
      expect(ShopifyApp.configuration.api_version).to eq '2019-10'
    end
  end
end