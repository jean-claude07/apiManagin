class CreateReponsequestiondebutants < ActiveRecord::Migration[6.0]
  def change
    create_table :reponsequestiondebutants do |t|
      t.string :reponse
      t.belongs_to :questiondebutant

    end
  end
end
