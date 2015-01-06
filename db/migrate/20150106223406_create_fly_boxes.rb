class CreateFlyBoxes < ActiveRecord::Migration
  def change
    create_table :fly_boxes do |t|
      t.string :name
      t.integer :user_id
      t.timestamps
    end
  end
end
