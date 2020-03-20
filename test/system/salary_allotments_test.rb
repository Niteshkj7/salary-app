require "application_system_test_case"

class SalaryAllotmentsTest < ApplicationSystemTestCase
  setup do
    @salary_allotment = salary_allotments(:one)
  end

  test "visiting the index" do
    visit salary_allotments_url
    assert_selector "h1", text: "Salary Allotments"
  end

  test "creating a Salary allotment" do
    visit salary_allotments_url
    click_on "New Salary Allotment"

    fill_in "Basic", with: @salary_allotment.basic
    fill_in "Da", with: @salary_allotment.da
    fill_in "Employee", with: @salary_allotment.employee_id
    fill_in "Hra", with: @salary_allotment.hra
    fill_in "Income tax", with: @salary_allotment.income_tax
    fill_in "State tax", with: @salary_allotment.state_tax
    click_on "Create Salary allotment"

    assert_text "Salary allotment was successfully created"
    click_on "Back"
  end

  test "updating a Salary allotment" do
    visit salary_allotments_url
    click_on "Edit", match: :first

    fill_in "Basic", with: @salary_allotment.basic
    fill_in "Da", with: @salary_allotment.da
    fill_in "Employee", with: @salary_allotment.employee_id
    fill_in "Hra", with: @salary_allotment.hra
    fill_in "Income tax", with: @salary_allotment.income_tax
    fill_in "State tax", with: @salary_allotment.state_tax
    click_on "Update Salary allotment"

    assert_text "Salary allotment was successfully updated"
    click_on "Back"
  end

  test "destroying a Salary allotment" do
    visit salary_allotments_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Salary allotment was successfully destroyed"
  end
end
