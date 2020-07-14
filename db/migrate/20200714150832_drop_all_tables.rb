class DropAllTables < ActiveRecord::Migration[6.0]
  def change
    drop_table :comments
    drop_table :articles
    drop_table :tags
  end
end
