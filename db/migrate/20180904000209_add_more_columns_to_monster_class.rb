class AddMoreColumnsToMonsterClass < ActiveRecord::Migration[5.0]
  def change
    add_column :monster_classes, :subtype, :string
    add_column :monster_classes, :alignment, :string
    add_column :monster_classes, :constitution_save, :integer
    add_column :monster_classes, :wisdom_save, :integer
    add_column :monster_classes, :dexterity_save, :integer
    add_column :monster_classes, :intelligence_save, :integer
    add_column :monster_classes, :charisma_save, :integer
    add_column :monster_classes, :history, :integer
    add_column :monster_classes, :perception, :integer
    add_column :monster_classes, :legendary_actions, :text
    add_column :monster_classes, :actions, :text
  end
end
