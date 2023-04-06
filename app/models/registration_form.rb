class RegistrationForm < ApplicationRecord
  extend FriendlyId
	friendly_id :slug_it, use: [:slugged]

  validates_presence_of :first_name, :last_name, :email, :date_of_birth, :on => :update

  private

  def slug_it
	  slug_candidates = []
		3.times do
			slug_candidates <<  "registration-" + SecureRandom.random_number(1000).to_s + SecureRandom.urlsafe_base64(7).parameterize.downcase
		end
	  slug_candidates
	end
end
