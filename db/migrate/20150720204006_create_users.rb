class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :image
      t.string :website
      t.string :token

      t.timestamps null: false
    end
  end
end
