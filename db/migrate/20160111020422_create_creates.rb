class CreateCreates < ActiveRecord::Migration
  def change
    create_table :creates do |t|
      t.string :User
      t.string :username
      t.string :email

      t.timestamps null: false
    end
  end
end
