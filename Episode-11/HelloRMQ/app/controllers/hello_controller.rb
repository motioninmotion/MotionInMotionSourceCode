class HelloController < UIViewController

  def viewDidLoad
    super

    rmq.stylesheet = HelloStylesheet
    rmq(self.view).apply_style :root_view

    rmq.append HelloView, :hello_view
  end

end