class MainStylesheet < RubyMotionQuery::Stylesheet

  def application_setup
    color.add_named :advanced_orange, '#ffa200'
  end

  def big_label(st)
    st.background_color = row_image
    st.color = color.advanced_orange
    st.text_alignment = :center
    st.font = font.system(36)
    st.frame = {t: 20, left: 20, width: 280, height: 50}
  end

  def retheme(st)
    if st.view.rmq_data.tags[:theme][:type] == :label
      st.color = color.white
    end
  end

  def row_image
    @row_image ||= begin
      bg_image = rmq.image.resource_resizable('row-bg', top: 10, left: 10, bottom: 10, right: 10)

      UIGraphicsBeginImageContext([280, 50])
      bg_image.drawInRect([[0,0], [280, 50]])
      new_image = UIGraphicsGetImageFromCurrentImageContext()
      UIGraphicsEndImageContext()

      UIColor.colorWithPatternImage(new_image)
    end
  end

end