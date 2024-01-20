require "test_helper"

class BusinesspartnersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @businesspartner = businesspartners(:one)
  end

  test "should get index" do
    get businesspartners_url
    assert_response :success
  end

  test "should get new" do
    get new_businesspartner_url
    assert_response :success
  end

  test "should create businesspartner" do
    assert_difference("Businesspartner.count") do
      post businesspartners_url, params: { businesspartner: { address: @businesspartner.address, corporate_number: @businesspartner.corporate_number, customer_code: @businesspartner.customer_code, customer_name: @businesspartner.customer_name, invoice_number: @businesspartner.invoice_number, postal_code: @businesspartner.postal_code, telephone_number: @businesspartner.telephone_number } }
    end

    assert_redirected_to businesspartner_url(Businesspartner.last)
  end

  test "should show businesspartner" do
    get businesspartner_url(@businesspartner)
    assert_response :success
  end

  test "should get edit" do
    get edit_businesspartner_url(@businesspartner)
    assert_response :success
  end

  test "should update businesspartner" do
    patch businesspartner_url(@businesspartner), params: { businesspartner: { address: @businesspartner.address, corporate_number: @businesspartner.corporate_number, customer_code: @businesspartner.customer_code, customer_name: @businesspartner.customer_name, invoice_number: @businesspartner.invoice_number, postal_code: @businesspartner.postal_code, telephone_number: @businesspartner.telephone_number } }
    assert_redirected_to businesspartner_url(@businesspartner)
  end

  test "should destroy businesspartner" do
    assert_difference("Businesspartner.count", -1) do
      delete businesspartner_url(@businesspartner)
    end

    assert_redirected_to businesspartners_url
  end
end
