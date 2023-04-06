class CreateRegistrationForms < ActiveRecord::Migration[7.0]
  def change
    create_table :registration_forms do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.datetime :date_of_birth
      t.boolean :submitted, default: false
      t.string :slug

      t.timestamps
    end
    add_index :registration_forms, :slug, unique: true
  end
end
