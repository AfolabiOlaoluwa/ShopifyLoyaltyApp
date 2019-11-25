# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EarningRule, type: :model do
  let(:subject) { build(:earning_rule) }
  let(:user) { FactoryBot.create(:user) }
  let(:user) { FactoryBot.create(:shop) }

  it 'is valid from the factory' do
    expect(subject).to be_valid
  end

  describe 'association' do
    it { is_expected.to belong_to(:user).class_name('User') }
    it { is_expected.to belong_to(:shop).class_name('Shop') }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:point) }
  end

  it 'is not valid without a user' do
    subject.user = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a shop' do
    subject.shop = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a point' do
    subject.point = nil
    expect(subject).to_not be_valid
  end

  # describe '#set_shop' do
  #   it 'defaults to nil if shop_id is not set' do
  #     subject.shop = nil
  #     expect(subject.shop).to eq nil
  #   end
  #
  #   it 'sets associated shop identity to shop_id field if user creates earning rule' do
  #     subject.shop.id = 1
  #     expect(subject.shop.id).to eq 1
  #   end
  # end
end