require "application_system_test_case"

class LeavesTest < ApplicationSystemTestCase
  setup do
    @leafe = leaves(:one)
  end

  test "visiting the index" do
    visit leaves_url
    assert_selector "h1", text: "Leaves"
  end

  test "creating a Leave" do
    visit leaves_url
    click_on "New Leave"

    fill_in "Employee", with: @leafe.employee_id
    fill_in "Leave balance", with: @leafe.leave_balance
    fill_in "Leave date", with: @leafe.leave_date
    fill_in "Leave type", with: @leafe.leave_type
    click_on "Create Leave"

    assert_text "Leave was successfully created"
    click_on "Back"
  end

  test "updating a Leave" do
    visit leaves_url
    click_on "Edit", match: :first

    fill_in "Employee", with: @leafe.employee_id
    fill_in "Leave balance", with: @leafe.leave_balance
    fill_in "Leave date", with: @leafe.leave_date
    fill_in "Leave type", with: @leafe.leave_type
    click_on "Update Leave"

    assert_text "Leave was successfully updated"
    click_on "Back"
  end

  test "destroying a Leave" do
    visit leaves_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Leave was successfully destroyed"
  end
end
