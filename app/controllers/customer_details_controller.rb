class CustomerDetailsController < ApplicationController
  # before_action :set_customer_detail, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @customer_details = CustomerDetail.all
  end
end
