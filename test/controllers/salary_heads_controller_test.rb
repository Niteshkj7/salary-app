require 'test_helper'

class SalaryHeadsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @salary_head = salary_heads(:one)
  end

  test "should get index" do
    get salary_heads_url
    assert_response :success
  end

  test "should get new" do
    get new_salary_head_url
    assert_response :success
  end

  test "should create salary_head" do
    assert_difference('SalaryHead.count') do
      post salary_heads_url, params: { salary_head: { deduction: @salary_head.deduction, earning: @salary_head.earning, employee_id: @salary_head.employee_id, head_name: @salary_head.head_name } }
    end

    assert_redirected_to salary_head_url(SalaryHead.last)
  end

  test "should show salary_head" do
    get salary_head_url(@salary_head)
    assert_response :success
  end

  test "should get edit" do
    get edit_salary_head_url(@salary_head)
    assert_response :success
  end

  test "should update salary_head" do
    patch salary_head_url(@salary_head), params: { salary_head: { deduction: @salary_head.deduction, earning: @salary_head.earning, employee_id: @salary_head.employee_id, head_name: @salary_head.head_name } }
    assert_redirected_to salary_head_url(@salary_head)
  end

  test "should destroy salary_head" do
    assert_difference('SalaryHead.count', -1) do
      delete salary_head_url(@salary_head)
    end

    assert_redirected_to salary_heads_url
  end
end
