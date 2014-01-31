class HelpScreen < PM::WebScreen
  title "Help"

  def on_load
    set_nav_bar_button :right, title: "Done", action: :close_help_screen
  end

  def content
    NSURL.URLWithString('https://motioninmotion.tv/about')
  end

  def load_failed
    UIAlert.alloc.initWithTitle('Failed to load',
      message: 'The help content failed t load sorry, double check you have an internet connection',
      delegate: nil,
      cancelButtonTitle: 'OK',
      otherButtonTitles: nil
    ).show
  end

  def close_help_screen
    close
  end
end
