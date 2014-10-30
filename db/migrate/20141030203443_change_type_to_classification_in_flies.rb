class ChangeTypeToClassificationInFlies < ActiveRecord::Migration
  def change
    rename_column :flies, :type, :giberish
  end
end
