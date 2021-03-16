class AddPdpcandidatToCandidatprofile < ActiveRecord::Migration[6.0]
  def change
    add_column :candidatprofiles, :pdpcandidat, :text
  end
end
