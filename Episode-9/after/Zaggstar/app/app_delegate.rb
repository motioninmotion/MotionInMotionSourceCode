class AppDelegate < PM::Delegate
  attr_accessor :zaggles

  def on_load(app, options)
    self.zaggles = []
    open ZaggstarFeed.new(nav_bar: true)
  end
end