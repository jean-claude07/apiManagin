class CreateQuestiondebutants < ActiveRecord::Migration[6.0]
  def change
    create_table :questiondebutants do |t|
      t.string :question

    end
  end
end
