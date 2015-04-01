class LanguageCode
  USA = 1033
  RUSSIA = 1049
  UKRAINE = 1058
  BELARUSSIA = 1059


  def LanguageCode.get_name_by_value(value)
    case value
      when 1033
        'English'
      when 1049
        'Russian'
      when 1058
        'Ukranian'
      when 1059
        'Belarussian'
      else
        'Unknown error!'
    end
  end

  def LanguageCode.get_name_by_key(key)
    case key
      when USA
        'English'
      when RUSSIA
        'Russian'
      when UKRAINE
        'Ukranian'
      when BELARUSSIA
        'Belarussian'
      else
        'Unknown error!'
    end
  end
end