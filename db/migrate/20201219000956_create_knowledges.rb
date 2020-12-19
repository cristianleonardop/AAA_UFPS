class CreateKnowledges < ActiveRecord::Migration[6.0]
  def change
    create_table :knowledges do |t|
	  t.integer :level, null: false, default: 0
      t.references :subject, null: false, foreign_key: true
      t.references :teacher, references: :users, null: false 
      t.timestamps
    end
  end
end
