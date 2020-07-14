class CreateArticlesCommentsAndTags < ActiveRecord::Migration[6.0]
  def change

    create_table :articles do |t|
      t.string     :title
      t.text       :body

      t.timestamps
    end

    create_table :comments do |t|
      t.string     :author_name
      t.text       :body
      t.references :article, null: false, foreign_key: true

      t.timestamps
    end

    create_table :tags do |t|
      t.string     :name

      t.timestamps
    end

    create_join_table :articles, :tags do |t|
      t.index :articles_id
      t.index :tags_id
    end

  end
end
