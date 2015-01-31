class Setting < ActiveRecord::Base
  def self.get_value_by_key(input_key)
    Setting.find_by_key(input_key).value
  end
end