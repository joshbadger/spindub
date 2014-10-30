class CreatePatterns < ActiveRecord::Migration
  def change
    create_table :patterns do |t|
      t.string :size
      t.string :materials
    end
  end
end
