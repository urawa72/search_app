class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :url
      t.string :price
      t.string :published_at
      t.text :content

      t.timestamps
    end
  end
end
