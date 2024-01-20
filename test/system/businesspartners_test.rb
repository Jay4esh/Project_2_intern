require "application_system_test_case"

class BusinesspartnersTest < ApplicationSystemTestCase
  setup do
    @businesspartner = businesspartners(:one)
  end

  test "visiting the index" do
    visit businesspartners_url
    assert_selector "h1", text: "Businesspartners"
  end

  test "should create businesspartner" do
    visit businesspartners_url
    click_on "New businesspartner"

    fill_in "Address", with: @businesspartner.address
    fill_in "Corporate number", with: @businesspartner.corporate_number
    fill_in "Customer code", with: @businesspartner.customer_code
    fill_in "Customer name", with: @businesspartner.customer_name
    fill_in "Invoice number", with: @businesspartner.invoice_number
    fill_in "Postal code", with: @businesspartner.postal_code
    fill_in "Telephone number", with: @businesspartner.telephone_number
    click_on "Create Businesspartner"

    assert_text "Businesspartner was successfully created"
    click_on "Back"
  end

  test "should update Businesspartner" do
    visit businesspartner_url(@businesspartner)
    click_on "Edit this businesspartner", match: :first

    fill_in "Address", with: @businesspartner.address
    fill_in "Corporate number", with: @businesspartner.corporate_number
    fill_in "Customer code", with: @businesspartner.customer_code
    fill_in "Customer name", with: @businesspartner.customer_name
    fill_in "Invoice number", with: @businesspartner.invoice_number
    fill_in "Postal code", with: @businesspartner.postal_code
    fill_in "Telephone number", with: @businesspartner.telephone_number
    click_on "Update Businesspartner"

    assert_text "Businesspartner was successfully updated"
    click_on "Back"
  end

  test "should destroy Businesspartner" do
    visit businesspartner_url(@businesspartner)
    click_on "Destroy this businesspartner", match: :first

    assert_text "Businesspartner was successfully destroyed"
  end
end
