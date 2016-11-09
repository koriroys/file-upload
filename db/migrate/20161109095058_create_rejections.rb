class CreateRejections < ActiveRecord::Migration[5.0]
  def change
    create_table :rejections do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :reason

      t.timestamps
    end
  end
end
