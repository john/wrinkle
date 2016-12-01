class CreateAuthentications < ActiveRecord::Migration[5.0]
  def change
    create_table :authentications do |t|
      t.string :provider,             null: false, default: ""
      t.string :encrypted_email,      null: false, default: ""
      t.string :encrypted_email_iv,   null: false, default: ""
      t.string :encrypted_token,      null: false, default: ""
      t.string :encrypted_token_iv,   null: false, default: ""
      t.string :encrypted_username,      null: false, default: ""
      t.string :encrypted_username_iv,   null: false, default: ""
      t.string :encrypted_password,      null: false, default: ""
      t.string :encrypted_password_iv,   null: false, default: ""
      t.string :encrypted_site_id,      null: false, default: ""
      t.string :encrypted_site_id_iv,   null: false, default: ""

      t.references :organization

      t.timestamps
    end
    add_index :authentications, :provider

  end
end
