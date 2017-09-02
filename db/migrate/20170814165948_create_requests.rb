class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :mobile
      t.string :address_one
      t.string :address_two
      t.string :state
      t.string :city
      t.integer :pin
      t.boolean :accept_flag

      t.timestamps null: false
    end
  end
end
