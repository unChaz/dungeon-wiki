class ChangeMonsterClassColumnTypes < ActiveRecord::Migration[5.0]
  def change
    remove_column :monster_classes, :legendary_actions
    remove_column :monster_classes, :actions
    add_column :monster_classes, :legendary_actions, :text, array: true, default: []
    add_column :monster_classes, :actions, :text, array: true, default: []
  end
end
