  class Remote
    BASE_URL = 'http://dnd5eapi.co/api/'

    def self.classes(id = nil)
      get('classes', id)
    end

    def self.monsters(id = nil)
      get('monsters', id)
    end

    def self.spells(id = nil)
      get('spells', id)
    end

    def self.populate(item)
      transform RestClient.get(item[:url], headers={})
    end

    class << self
      private

      def get(endpoint, id = nil)
        url = "#{BASE_URL}#{endpoint}/#{id}"
        transform RestClient.get(url, headers={})
      end

      def transform(response)
        if response.code == 200
          eval(response.body)
        else
          Rails.log '=== API Error ==='
          Rails.log response.body
          raise 'An API Error Has Occured'
        end
      end
    end
  end
