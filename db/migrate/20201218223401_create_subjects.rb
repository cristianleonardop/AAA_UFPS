class CreateSubjects < ActiveRecord::Migration[6.0]
  def change
    create_table :subjects do |t|
      t.string :name, null: false, default: "" 
      t.text :description, null: false, default: "" 
      t.timestamps
    end
  end
end
