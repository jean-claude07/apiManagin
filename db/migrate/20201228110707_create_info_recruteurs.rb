class CreateInfoRecruteurs < ActiveRecord::Migration[6.0]
  def change
    create_table :info_recruteurs do |t|
      t.string :adress
      t.string :type
      t.text :details
      t.belongs_to :recruteur

      t.timestamps
    end
  end
end
