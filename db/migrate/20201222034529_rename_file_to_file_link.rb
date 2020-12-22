class RenameFileToFileLink < ActiveRecord::Migration[6.0]
  def change
  	rename_column :homeworks, :file, :file_link
  end
end
