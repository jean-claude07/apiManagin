class CreateChoixquestiondebutants < ActiveRecord::Migration[6.0]
  def change
    create_table :choixquestiondebutants do |t|
      t.string :choix
      t.belongs_to :questiondebutant

    end
  end
end
