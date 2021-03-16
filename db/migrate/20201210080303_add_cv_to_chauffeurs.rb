class AddCvToChauffeurs < ActiveRecord::Migration[6.0]
  def change
    add_column :chauffeurs, :cv, :text
  end
end
