class AddAuthenticationTokenToCandidatprofiles < ActiveRecord::Migration[6.0]
  def change
    add_column :candidatprofiles, :authentication_token, :text, limit: 2020
    add_index :candidatprofiles, :authentication_token, unique: true
  end
end
