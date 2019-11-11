require "application_system_test_case"

class EarningRulesTest < ApplicationSystemTestCase
  setup do
    @earning_rule = earning_rules(:one)
  end

  test "visiting the index" do
    visit earning_rules_url
    assert_selector "h1", text: "Earning Rules"
  end

  test "creating a Earning rule" do
    visit earning_rules_url
    click_on "New Earning Rule"

    fill_in "Name", with: @earning_rule.name
    fill_in "Point", with: @earning_rule.point
    check "Status" if @earning_rule.status
    click_on "Create Earning rule"

    assert_text "Earning rule was successfully created"
    click_on "Back"
  end

  test "updating a Earning rule" do
    visit earning_rules_url
    click_on "Edit", match: :first

    fill_in "Name", with: @earning_rule.name
    fill_in "Point", with: @earning_rule.point
    check "Status" if @earning_rule.status
    click_on "Update Earning rule"

    assert_text "Earning rule was successfully updated"
    click_on "Back"
  end

  test "destroying a Earning rule" do
    visit earning_rules_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Earning rule was successfully destroyed"
  end
end
