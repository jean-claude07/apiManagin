class AddAuthenticationTokenToAdmins < ActiveRecord::Migration[6.0]
  def change
    add_column :admins, :authentication_token, :string, limit: 35
    add_index :admins, :authentication_token, unique: true
  end
end
