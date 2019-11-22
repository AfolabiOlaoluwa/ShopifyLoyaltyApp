# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CustomerDetail, type: :model do
  let(:subject) { build(:customer_detail) }
  let(:user) { FactoryBot.create(:user) }
  let(:user) { FactoryBot.create(:shop) }

  it 'is valid from the factory' do
    expect(subject).to be_valid
  end

  describe 'association' do
    it { is_expected.to belong_to(:user).class_name('User') }
    it { is_expected.to belong_to(:shop).class_name('Shop') }
  end

  it 'is not valid without a user' do
    subject.user = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a shop' do
    subject.shop = nil
    expect(subject).to_not be_valid
  end
end