class CustomerDetailsController < AuthenticatedController
  include StrictQueries::Concern

  before_action :authenticate_user!

  def index
    @customer_details = customer_detail.shop.load
  end
end
