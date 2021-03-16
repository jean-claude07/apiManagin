class AddAuthenticationTokenToRecruteurs < ActiveRecord::Migration[6.0]
  def change
    add_column :recruteurs, :authentication_token, :string, limit: 32
    add_index :recruteurs, :authentication_token, unique: true
  end
end
