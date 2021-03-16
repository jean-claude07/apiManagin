class AddPermisToChauffeurs < ActiveRecord::Migration[6.0]
  def change
    add_column :chauffeurs, :permis, :text
  end
end
