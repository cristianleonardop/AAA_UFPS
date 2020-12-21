class CreateTutorings < ActiveRecord::Migration[6.0]
  def change
    create_table :tutorings do |t|
  	  t.string :file, null: false, default: ""
      t.date :due_date, null: false
  	  t.integer :state, null: false, default: 0
  	  t.integer :duration, null: false, default: 0  	  
      t.references :subject, null: false, foreign_key: true
      t.references :homework, null: false, foreign_key: true
      t.references :teacher, references: :users, null: false 
    end
  end
end
