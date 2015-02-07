class Setting < ActiveRecord::Base
  SETTING_KEY = "key_settings"

  after_commit :flush_cache

  class << self
    def cached_settings
      fetch_cached
    end

    def value_of(key_name: :header_info)
      fetch_cached[key_name]
    end

    def map_data
      all.
      inject({}) { |result, setting| result.merge(setting.key.to_sym => setting.value) }
    end

    def fetch_cached
      Rails.cache.fetch(SETTING_KEY) { map_data }
    end

    Setting.fetch_cached.keys.each do |key|
      define_method "value_of_#{key}" do
        value_of(key_name: key)
      end
    end
  end

  def flush_cache
    Rails.cache.delete(SETTING_KEY)
  end
end
