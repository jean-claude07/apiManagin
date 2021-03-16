class AddPdprecruteurToRecruteurs < ActiveRecord::Migration[6.0]
  def change
    add_column :recruteurs, :pdprecruteur, :text
  end
end
