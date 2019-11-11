require "application_system_test_case"

class CustomerDetailsTest < ApplicationSystemTestCase
  setup do
    @customer_detail = customer_details(:one)
  end

  test "visiting the index" do
    visit customer_details_url
    assert_selector "h1", text: "Customer Details"
  end

  test "creating a Customer detail" do
    visit customer_details_url
    click_on "New Customer Detail"

    fill_in "Earning rule", with: @customer_detail.earning_rule_id
    fill_in "Email", with: @customer_detail.email
    fill_in "Event", with: @customer_detail.event
    fill_in "Name", with: @customer_detail.name
    fill_in "Point balance", with: @customer_detail.point_balance
    click_on "Create Customer detail"

    assert_text "Customer detail was successfully created"
    click_on "Back"
  end

  test "updating a Customer detail" do
    visit customer_details_url
    click_on "Edit", match: :first

    fill_in "Earning rule", with: @customer_detail.earning_rule_id
    fill_in "Email", with: @customer_detail.email
    fill_in "Event", with: @customer_detail.event
    fill_in "Name", with: @customer_detail.name
    fill_in "Point balance", with: @customer_detail.point_balance
    click_on "Update Customer detail"

    assert_text "Customer detail was successfully updated"
    click_on "Back"
  end

  test "destroying a Customer detail" do
    visit customer_details_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Customer detail was successfully destroyed"
  end
end
