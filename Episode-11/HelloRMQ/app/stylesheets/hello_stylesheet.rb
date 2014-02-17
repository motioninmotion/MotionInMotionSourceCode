class HelloStylesheet < RubyMotionQuery::Stylesheet

  def root_view(st)
    st.background_color = color.white
  end

  def hello_view(st)
    st.frame = :full
  end

  def hello_label(st)
    st.frame = [[20, 175], [280, 45]]
    st.text = "Hello RMQ!"
    st.text_alignment = :center
    st.font = font.system(36)
  end

  def hello_button(st)
    st.frame = [[20, 275], [280, 50]]
    st.background_color = color.gray
    st.text = "Press me!"
    st.corner_radius = 10
  end

end