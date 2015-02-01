class HomesController < ApplicationController
  def index
    @header_intro = get_text_value_by_key("Header_intro")
    @header_title = get_text_value_by_key("Header_title")
    @first_feature_title = get_text_value_by_key("First_feature_title")
    @second_feature_title = get_text_value_by_key("Second_feature_title")
    @third_feature_title = get_text_value_by_key("Third_feature_title")
    @fourth_feature_title = get_text_value_by_key("Fourth_feature_title")
    @template_title = get_text_value_by_key("Templates_choosing_title")
    @commit_title = get_text_value_by_key("Commitment_title")
    @follow_title = get_text_value_by_key("Follow_title")
    @first_feature_content = get_text_value_by_key("First_feature_content")
    @second_feature_content = get_text_value_by_key("Second_feature_content")
    @third_feature_content = get_text_value_by_key("Third_feature_content")
    @fourth_feature_content = get_text_value_by_key("Fourth_feature_content")
    @follow_intro = get_text_value_by_key("Follow_intro")
  end
  
  private
    def get_text_value_by_key(input)
      text_settings = Setting.cached_settings
      text_settings.find{ |u| u.key == input }.value
    end
end
