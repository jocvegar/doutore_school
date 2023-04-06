require "application_system_test_case"

class RegistrationFormsTest < ApplicationSystemTestCase
  setup do
    @registration_form = registration_forms(:one)
  end

  test "visiting the index" do
    visit registration_forms_url
    assert_selector "h1", text: "Registration forms"
  end

  test "should create registration form" do
    visit registration_forms_url
    click_on "New registration form"

    fill_in "Date of birth", with: @registration_form.date_of_birth
    fill_in "Email", with: @registration_form.email
    fill_in "First name", with: @registration_form.first_name
    fill_in "Last name", with: @registration_form.last_name
    fill_in "Slug", with: @registration_form.slug
    check "Submitted" if @registration_form.submitted
    click_on "Create Registration form"

    assert_text "Registration form was successfully created"
    click_on "Back"
  end

  test "should update Registration form" do
    visit registration_form_url(@registration_form)
    click_on "Edit this registration form", match: :first

    fill_in "Date of birth", with: @registration_form.date_of_birth
    fill_in "Email", with: @registration_form.email
    fill_in "First name", with: @registration_form.first_name
    fill_in "Last name", with: @registration_form.last_name
    fill_in "Slug", with: @registration_form.slug
    check "Submitted" if @registration_form.submitted
    click_on "Update Registration form"

    assert_text "Registration form was successfully updated"
    click_on "Back"
  end

  test "should destroy Registration form" do
    visit registration_form_url(@registration_form)
    click_on "Destroy this registration form", match: :first

    assert_text "Registration form was successfully destroyed"
  end
end
