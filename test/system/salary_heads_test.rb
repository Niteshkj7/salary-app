require "application_system_test_case"

class SalaryHeadsTest < ApplicationSystemTestCase
  setup do
    @salary_head = salary_heads(:one)
  end

  test "visiting the index" do
    visit salary_heads_url
    assert_selector "h1", text: "Salary Heads"
  end

  test "creating a Salary head" do
    visit salary_heads_url
    click_on "New Salary Head"

    check "Deduction" if @salary_head.deduction
    check "Earning" if @salary_head.earning
    fill_in "Employee", with: @salary_head.employee_id
    fill_in "Head name", with: @salary_head.head_name
    click_on "Create Salary head"

    assert_text "Salary head was successfully created"
    click_on "Back"
  end

  test "updating a Salary head" do
    visit salary_heads_url
    click_on "Edit", match: :first

    check "Deduction" if @salary_head.deduction
    check "Earning" if @salary_head.earning
    fill_in "Employee", with: @salary_head.employee_id
    fill_in "Head name", with: @salary_head.head_name
    click_on "Update Salary head"

    assert_text "Salary head was successfully updated"
    click_on "Back"
  end

  test "destroying a Salary head" do
    visit salary_heads_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Salary head was successfully destroyed"
  end
end
