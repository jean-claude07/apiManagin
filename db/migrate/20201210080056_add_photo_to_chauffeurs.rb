class AddPhotoToChauffeurs < ActiveRecord::Migration[6.0]
  def change
    add_column :chauffeurs, :photo, :text
  end
end
