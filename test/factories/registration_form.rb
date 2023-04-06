FactoryBot.define do
  factory :registration_form do
    first_name { "John" }
    last_name  { "Doe" }
    email  { "john@doe.com" }
    date_of_birth { DateTime.now - 10.years }
  end
end
