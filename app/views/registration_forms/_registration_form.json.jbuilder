json.extract! registration_form, :id, :first_name, :last_name, :email, :date_of_birth, :submitted, :slug, :created_at, :updated_at
json.url registration_form_url(registration_form, format: :json)
