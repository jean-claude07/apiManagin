class CreateAnnonces < ActiveRecord::Migration[6.0]
  def change
    create_table :annonces do |t|
      t.string :contact
      t.string :poste
      t.string :email
      t.string :reference
      t.string :etablisment
      t.string :contrat
      t.string :province
      t.string :libelle
      t.string :pretention
      t.text :description
      t.string :date_limite
      t.belongs_to :recruteur
      t.text :profil_rechercher
      t.string :client

      t.timestamps
    end
  end
end
