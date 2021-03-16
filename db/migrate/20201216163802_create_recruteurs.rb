class CreateRecruteurs < ActiveRecord::Migration[6.0]
  def change
    create_table :recruteurs do |t|
      t.string :nom
      t.string :prenom
      t.string :telephone
      t.string :entreprise
      t.string :email
      t.string :password_digest
      t.string :other

      t.timestamps
    end
  end
end
