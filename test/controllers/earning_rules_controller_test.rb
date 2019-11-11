require 'test_helper'

class EarningRulesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @earning_rule = earning_rules(:one)
  end

  test "should get index" do
    get earning_rules_url
    assert_response :success
  end

  test "should get new" do
    get new_earning_rule_url
    assert_response :success
  end

  test "should create earning_rule" do
    assert_difference('EarningRule.count') do
      post earning_rules_url, params: { earning_rule: { name: @earning_rule.name, point: @earning_rule.point, status: @earning_rule.status } }
    end

    assert_redirected_to earning_rule_url(EarningRule.last)
  end

  test "should show earning_rule" do
    get earning_rule_url(@earning_rule)
    assert_response :success
  end

  test "should get edit" do
    get edit_earning_rule_url(@earning_rule)
    assert_response :success
  end

  test "should update earning_rule" do
    patch earning_rule_url(@earning_rule), params: { earning_rule: { name: @earning_rule.name, point: @earning_rule.point, status: @earning_rule.status } }
    assert_redirected_to earning_rule_url(@earning_rule)
  end

  test "should destroy earning_rule" do
    assert_difference('EarningRule.count', -1) do
      delete earning_rule_url(@earning_rule)
    end

    assert_redirected_to earning_rules_url
  end
end
