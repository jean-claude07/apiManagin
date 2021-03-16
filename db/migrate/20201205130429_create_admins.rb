class CreateAdmins < ActiveRecord::Migration[6.0]
  def change
    create_table :admins do |t|
      t.string :nom
      t.string :prenom
      t.string :password_digest
      t.string :email

      t.timestamps
    end
  end
end
