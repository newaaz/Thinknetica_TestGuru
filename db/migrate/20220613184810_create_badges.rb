class CreateBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :badges do |t|
      t.string :title, null: false
      t.string :image, null: false
      t.integer :rule_name, null: false
      t.string :rule_value, null: false

      t.timestamps
    end
  end
end
