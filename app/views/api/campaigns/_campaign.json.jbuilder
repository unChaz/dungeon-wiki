json.extract! campaign, :id, :name, :created_at, :updated_at
json.players campaign.players
json.locations campaign.locations
json.monster_pools campaign.monster_pools
