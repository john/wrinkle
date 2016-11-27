class CreateAuthentications < ActiveRecord::Migration[5.0]
  def change
    create_table :authentications do |t|
      t.string :provider,             null: false, default: ""


      # t.string :token,              null: false, default: ""
      t.string :encrypted_token,      null: false, default: ""
      t.string :encrypted_token_iv,   null: false, default: ""

      t.references :organization

      t.timestamps
    end
    add_index :authentications, :provider

  end
end
