class MonsterPool < ApplicationRecord
  def add_monster(id)
    self.monster_class_ids << id
    self.save
  end

  def monsters
    MonsterClass.where(id: self.monster_class_ids)
  end
end
