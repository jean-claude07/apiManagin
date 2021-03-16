class CreatePlusinfos < ActiveRecord::Migration[6.0]
  def change
    create_table :plusinfos do |t|
      t.string :adresse
      t.string :etude
      t.text :experience
      t.belongs_to :candidatprofile

      t.timestamps
    end
  end
end
