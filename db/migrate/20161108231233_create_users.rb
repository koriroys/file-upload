class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email


      t.timestamps
    end
    add_index :users, [:first_name, :last_name], unique: true
    add_index :users, :email, unique: true
  end
end
