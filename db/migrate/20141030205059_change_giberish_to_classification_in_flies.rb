class ChangeGiberishToClassificationInFlies < ActiveRecord::Migration
  def change
    rename_column :flies, :giberish, :classification
  end
end
