class AppDelegate < PM::Delegate
  def on_load(app, options)
    open ZaggstarFeed.new(nav_bar: true)
  end
end