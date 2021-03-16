class CreateCandidatprofiles < ActiveRecord::Migration[6.0]
  def change
    create_table :candidatprofiles do |t|
      t.string :nom
      t.string :prenom
      t.string :telephone
      t.string :email
      t.string :password_digest
      t.string :string

      t.timestamps
    end
  end
end
