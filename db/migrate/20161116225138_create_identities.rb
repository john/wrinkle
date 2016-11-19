class CreateIdentities < ActiveRecord::Migration[5.0]
  def change
    create_table :identities do |t|
      t.string :uid, null: false, default: ""
      t.string :provider, null: false, default: ""
      t.string :token, null: false, default: ""
      t.string :refresh_token, null: false, default: ""
      t.string :expires_at, null: false, default: ""
      t.string :name, null: false, default: ""
      t.string :email, null: false, default: ""
      t.string :image_url, null: false, default: ""

      t.references :user

      t.timestamps null: false
    end
  end
end
