class MonsterClass < ApplicationRecord
  def actions
    self[:actions].map do |action|
      JSON.parse(action)
    end
  end

  def legendary_actions
    self[:legendary_actions].map do |action|
      JSON.parse(action)
    end
  end

  def special_abilities
    self[:special_abilities].map do |action|
      JSON.parse(action)
    end
  end
end
