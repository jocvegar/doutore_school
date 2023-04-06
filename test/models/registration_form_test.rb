require "test_helper"

class RegistrationFormTest < ActiveSupport::TestCase
  test "valid factory" do
    form = build(:registration_form)
    assert form.valid?
  end

  test "should validate required fields" do
    form = create(:registration_form)

    form.first_name = nil
    form.save
    assert form.invalid?

    form.last_name = nil
    form.save
    assert form.invalid?

    form.email = nil
    form.save
    assert form.invalid?

    form.date_of_birth = nil
    form.save
    assert form.invalid?
  end
end
