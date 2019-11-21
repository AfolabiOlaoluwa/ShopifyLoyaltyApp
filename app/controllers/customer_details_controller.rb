class CustomerDetailsController < ApplicationController
  include StrictQueries::Concern

  before_action :authenticate_user!

  def index
    @customer_details = CustomerDetail.all.load
  end
end
