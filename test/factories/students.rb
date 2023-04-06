FactoryBot.define do
  factory :student do
    first_name { "Good" }
    last_name { "Student" }
    date_of_birth { DateTime.now - 10.years }
    email { "email@email.com" }
  end
end
