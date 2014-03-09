class MainStylesheet < RubyMotionQuery::Stylesheet

  def big_label(st)
    st.background_color = color.blue
    st.color = color.green
    st.text_alignment = :center
    st.font = font.system(36)
    st.frame = {t: 20, left: 20, width: 280, height: 50}
  end

end