class Setting < ActiveRecord::Base
  SETTING_KEY = "all_text_settings"

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
  end

  def flush_cache
    Rails.cache.delete(SETTING_KEY)
  end
end
