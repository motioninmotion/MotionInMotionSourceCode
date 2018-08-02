class AppDelegate < PM::Delegate
  def on_load(_, _)
    open ZaggstarFeed.new(nav_bar: true)
  end
end