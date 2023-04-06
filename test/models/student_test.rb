require "test_helper"

class StudentTest < ActiveSupport::TestCase
  test "valid factory" do
    form = build(:student)
    assert form.valid?
  end
end
