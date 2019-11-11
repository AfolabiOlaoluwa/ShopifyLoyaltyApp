require 'test_helper'

class CustomerDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @customer_detail = customer_details(:one)
  end

  test "should get index" do
    get customer_details_url
    assert_response :success
  end

  test "should get new" do
    get new_customer_detail_url
    assert_response :success
  end

  test "should create customer_detail" do
    assert_difference('CustomerDetail.count') do
      post customer_details_url, params: { customer_detail: { earning_rule_id: @customer_detail.earning_rule_id, email: @customer_detail.email, event: @customer_detail.event, name: @customer_detail.name, point_balance: @customer_detail.point_balance } }
    end

    assert_redirected_to customer_detail_url(CustomerDetail.last)
  end

  test "should show customer_detail" do
    get customer_detail_url(@customer_detail)
    assert_response :success
  end

  test "should get edit" do
    get edit_customer_detail_url(@customer_detail)
    assert_response :success
  end

  test "should update customer_detail" do
    patch customer_detail_url(@customer_detail), params: { customer_detail: { earning_rule_id: @customer_detail.earning_rule_id, email: @customer_detail.email, event: @customer_detail.event, name: @customer_detail.name, point_balance: @customer_detail.point_balance } }
    assert_redirected_to customer_detail_url(@customer_detail)
  end

  test "should destroy customer_detail" do
    assert_difference('CustomerDetail.count', -1) do
      delete customer_detail_url(@customer_detail)
    end

    assert_redirected_to customer_details_url
  end
end
