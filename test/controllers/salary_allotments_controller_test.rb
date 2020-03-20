require 'test_helper'

class SalaryAllotmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @salary_allotment = salary_allotments(:one)
  end

  test "should get index" do
    get salary_allotments_url
    assert_response :success
  end

  test "should get new" do
    get new_salary_allotment_url
    assert_response :success
  end

  test "should create salary_allotment" do
    assert_difference('SalaryAllotment.count') do
      post salary_allotments_url, params: { salary_allotment: { basic: @salary_allotment.basic, da: @salary_allotment.da, employee_id: @salary_allotment.employee_id, hra: @salary_allotment.hra, income_tax: @salary_allotment.income_tax, state_tax: @salary_allotment.state_tax } }
    end

    assert_redirected_to salary_allotment_url(SalaryAllotment.last)
  end

  test "should show salary_allotment" do
    get salary_allotment_url(@salary_allotment)
    assert_response :success
  end

  test "should get edit" do
    get edit_salary_allotment_url(@salary_allotment)
    assert_response :success
  end

  test "should update salary_allotment" do
    patch salary_allotment_url(@salary_allotment), params: { salary_allotment: { basic: @salary_allotment.basic, da: @salary_allotment.da, employee_id: @salary_allotment.employee_id, hra: @salary_allotment.hra, income_tax: @salary_allotment.income_tax, state_tax: @salary_allotment.state_tax } }
    assert_redirected_to salary_allotment_url(@salary_allotment)
  end

  test "should destroy salary_allotment" do
    assert_difference('SalaryAllotment.count', -1) do
      delete salary_allotment_url(@salary_allotment)
    end

    assert_redirected_to salary_allotments_url
  end
end
