class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.datetime :date_of_birth
      t.string :email

      t.timestamps
    end
  end
end
