class CreateFlies < ActiveRecord::Migration
  def change
    create_table :flies do |t|
      t.string  :name
      t.string  :type
    end
  end
end
