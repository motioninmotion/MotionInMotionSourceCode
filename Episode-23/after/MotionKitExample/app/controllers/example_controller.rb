class ExampleController < UIViewController
  def loadView
    @layout = ExampleLayout.new
    self.view = @layout.view
    @layout.add_constraints
  end
end
