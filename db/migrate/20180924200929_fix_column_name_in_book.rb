class FixColumnNameInBook < ActiveRecord::Migration[5.1]
  def change
    rename_column :books, :editor, :publisher
  end
end
