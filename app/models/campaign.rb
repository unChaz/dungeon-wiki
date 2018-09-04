class Campaign < ApplicationRecord
  def add_location(name)
    Location.create(name: name, campaign_id: self.id)
  end

  def locations
    Location.where(campaign_id: self.id)
  end

  def add_player(name, ac = nil)
    Player.create(name: name, armor_class: ac, campaign_id: self.id)
  end

  def players
    Player.where(campaign_id: self.id)
  end

  def add_monster_pool(name)
    MonsterPool.create(name: name, campaign_id: self.id)
  end

  def monster_pools
    MonsterPool.where(campaign_id: self.id)
  end
end
