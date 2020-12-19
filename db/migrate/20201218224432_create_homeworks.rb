class CreateHomeworks < ActiveRecord::Migration[6.0]
  def change
    create_table :homeworks do |t|
      t.string :name, null: false, default: "" 
      t.text :description, null: false, default: "" 
      t.string :file, null: false, default: "" 
      t.integer :price, null: false, default: "" 
      t.date :due_date, null: false
      t.references :student, references: :users, null: false
      t.references :subject, null: false, foreign_key: true
      t.timestamps
    end
  end
end
