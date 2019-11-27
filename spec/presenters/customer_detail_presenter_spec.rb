# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CustomerDetailPresenter do
  subject { CustomerDetailPresenter.new(customer_detail, customer_detail) }

  describe '#first_name' do
    let(:customer_detail) { double(first_name: 'Olaoluwa') }

    it 'returns First Name' do
      expect(subject.first_name).to eq customer_detail.first_name
    end
  end

  describe '#last_name' do
    let(:customer_detail) { double(last_name: "Afolabi") }

    it 'return Last Name' do
      expect(subject.last_name).to eq customer_detail.last_name
    end
  end

  describe '#email' do
    let(:customer_detail) { double(email: "contact@afolabiolaoluwa.com") }

    it 'return Email' do
      expect(subject.email).to eq customer_detail.email
    end
  end

  describe '#previous_point' do
    context 'when previous_point is nil' do
      let(:customer_detail) { double(previous_point: nil) }

      it 'returns nil' do
        expect(subject.previous_point).to eq customer_detail.previous_point
      end
    end

    context 'when previous_point is not nil' do
      let(:customer_detail) { double(previous_point: 84343.0) }
      let(:points) { double(value: (customer_detail.previous_point)) }

      it 'returns the point_balance' do
        expect(subject.previous_point).to eq ActiveSupport::NumberHelper.number_to_delimited(points.value)
      end
    end
  end

  describe '#point_balance' do
    context 'when point_balance is nil' do
      let(:customer_detail) { double(point_balance: nil) }

      it 'returns nil' do
        expect(subject.point_balance).to eq customer_detail.point_balance
      end
    end

    context 'when point_balance is not nil' do
      let(:customer_detail) { double(point_balance: 84343.0) }
      let(:points) { double(value: (customer_detail.point_balance)) }

      it 'returns the point_balance' do
        expect(subject.point_balance).to eq ActiveSupport::NumberHelper.number_to_delimited(points.value)
      end
    end
  end
end