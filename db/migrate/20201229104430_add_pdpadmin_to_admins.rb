class AddPdpadminToAdmins < ActiveRecord::Migration[6.0]
  def change
    add_column :admins, :pdpadmin, :text
  end
end
