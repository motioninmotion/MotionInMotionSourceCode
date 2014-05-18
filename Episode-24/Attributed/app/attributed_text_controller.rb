class AttributedTextController < UIViewController
  def loadView
    self.view = AttributedTextView.new
  end

  def viewDidAppear(animated)
    view.layout
  end
end
