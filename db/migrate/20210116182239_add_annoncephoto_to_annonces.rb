class AddAnnoncephotoToAnnonces < ActiveRecord::Migration[6.0]
  def change
    add_column :annonces, :annoncephoto, :text
  end
end
