class AddPropertiesUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :last_name, :string
    add_column :users, :role, :integer
    add_column :users, :birthday, :date
    add_column :users, :score, :integer
  end
end
