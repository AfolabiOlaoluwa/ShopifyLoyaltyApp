class CustomerDetailsController < ApplicationController
  include StrictQueries::Concern

  before_action :authenticate_user!

  def index
    @customer_details = current_shop.customer_details.load
  end

  private

  def customer_detail_params
    params.require(:customer_detail).permit(:user_id, :shop_id, :first_name, :last_name, :email, :amount_spent, :previous_point, :balance_point)
  end
end
