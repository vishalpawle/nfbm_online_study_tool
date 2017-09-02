class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.string :option_name
      t.boolean :option_right
      t.references :question, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
