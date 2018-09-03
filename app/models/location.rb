class Location < ApplicationRecord
  def add_encounter(name)
    Encounter.create(location_id: self.id, name: name)
  end

  def encounters
    Encounter.where(location_id: self.id)
  end
end
