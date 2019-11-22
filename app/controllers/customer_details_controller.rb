class CustomerDetailsController < AuthenticatedController
  include StrictQueries::Concern

  before_action :authenticate_user!

  def index
    @customer_details = current_user.customer_details.load
  end
end
