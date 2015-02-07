module HomesHelper
  def header_intro
    get_text_value_by_key("Header_intro")
  end

  def header_title
    get_text_value_by_key("Header_title")
  end

  def first_feature_title
    get_text_value_by_key("First_feature_title")
  end

  def second_feature_title
    get_text_value_by_key("Second_feature_title")
  end

  def third_feature_title
    get_text_value_by_key("Third_feature_title")
  end

  def fourth_feature_title
    get_text_value_by_key("Fourth_feature_title")
  end

  def templates_choosing_title
    get_text_value_by_key("Templates_choosing_title")
  end

  def commitment_title 
    get_text_value_by_key("Commitment_title")
  end

  def follow_title
    get_text_value_by_key("Follow_title")
  end

  def first_feature_content
    get_text_value_by_key("First_feature_content")
  end

  def second_feature_content
    get_text_value_by_key("Second_feature_content")
  end

  def third_feature_content
    get_text_value_by_key("Third_feature_content")
  end

  def fourth_feature_content
    get_text_value_by_key("Fourth_feature_content")
  end

  def follow_intro
    get_text_value_by_key("Follow_intro")
  end

  private
    def get_text_value_by_key(input)
      text_settings = Setting.cached_settings
      text_settings.find{ |u| u.key == input }.value
    end
end
