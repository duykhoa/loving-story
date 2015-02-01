class Setting < ActiveRecord::Base
  after_commit :flush_cache

  def self.cached_settings
    Rails.cache.fetch("all_text_settings") { all.to_a }
  end

  def flush_cache
    Rails.cache.delete("all_text_settings")
  end
end
