class HelpScreen < PM::WebScreen
  title 'Help'

  def on_load
    set_nav_bar_button :right, title: 'Done', action: :close_help_screen
  end

  def content
    NSURL.URLWithString('https://motioninmotion.tv/about')
  end

  def load_failed
    alert = UIAlertController.alertControllerWithTitle('Failed to load',
                                                       message: 'The help content failed to load sorry, double check you have an internet connection.',
                                                       preferredStyle: UIAlertControllerStyleAlert)
    action = UIAlertAction.actionWithTitle('Ok', style: UIAlertActionStyleDefault, handler: nil)
    alert.addAction(action)
    presentViewController(alert, animated: true, completion: nil)
  end

  def close_help_screen
    close
  end
end