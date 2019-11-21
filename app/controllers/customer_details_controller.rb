# class CustomerDetailsController < ApplicationController
class CustomerDetailsController < AuthenticatedController
  include StrictQueries::Concern

  before_action :authenticate_user!

  def index
    # @customer_details = CustomerDetail.all.load
    @customer_details = shop.customer_details.load
  end
end
