class AddColumnToBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :isbn_13, :string
    add_column :books, :isbn_10, :string
  end
end
