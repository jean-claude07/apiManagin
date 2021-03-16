class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts do |t|
      t.string :nom
      t.string :email
      t.string :subject
      t.text :message
      t.string :telephone

      t.timestamps
    end
  end
end
