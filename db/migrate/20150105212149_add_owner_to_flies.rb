class AddOwnerToFlies < ActiveRecord::Migration
  def change
    add_column :flies, :user_id, :integer
  end
end
