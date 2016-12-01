class CreateDocuments < ActiveRecord::Migration[5.0]
  def change
    create_table :documents do |t|
      t.string :slug, null: false
      t.string :source, null: false, default: ""
      t.string :source_id, null: false, default: ""
      t.string :source_slug, null: false, default: ""
      t.datetime :source_created_at
      t.datetime :source_updated_at
      t.string :source_link, null: false, default: ""
      t.string :kind, null: false, default: ""
      t.string :mime_type, null: false, default: ""
      t.string :title, null: false, default: ""
      t.string :author_id, null: false, default: ""
      t.string :author, null: false, default: ""
      t.string :dateline, null: false, default: ""
      t.string :subtitle, null: false, default: ""
      t.text :body_html, null: false, default: ""

      t.timestamps null: false
    end
    add_index :documents, :slug, unique: true

  end
end
