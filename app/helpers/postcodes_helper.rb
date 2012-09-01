module PostcodesHelper
  def highlighter(text, term)
    text.gsub( /(#{term})/,'<span class="strong">\1</span>' ).html_safe 
  end
end
