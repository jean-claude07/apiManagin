class CreateChauffeurs < ActiveRecord::Migration[6.0]
  def change
    create_table :chauffeurs do |t|
      t.string :contact1
      t.string :contact2
      t.string :categorie_permis
      t.string :nom
      t.string :prenom
      t.string :brith
      t.string :club
      t.string :adresse
      t.string :ville
      t.belongs_to :candidatprofile
      t.string :province
      t.string :fumeur
      t.string :alcolique
      t.string :marie
      t.string :nombre_enfant
      t.string :port_lunette
      t.string :annee_de_debut
      t.string :salaire_envisager
      t.string :disponible
      t.string :observation

      t.timestamps
    end
  end
end
