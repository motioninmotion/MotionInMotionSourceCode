class ImageController < UIViewController
  def loadView
    self.view = UIScrollView.new
    self.view.contentSize = [320, 1000]
    self.view.backgroundColor = UIColor.blackColor

    self.view.addSubview(@image_view_one = UIImageView.new.tap do |iv|
      iv.frame = [[20, 100], [86, 86]]
      iv.backgroundColor = UIColor.redColor
    end)

    self.view.addSubview(@image_view_two = UIImageView.new.tap do |iv|
      iv.frame = [[117, 100], [86, 86]]
      iv.backgroundColor = UIColor.greenColor
    end)

    self.view.addSubview(@image_view_three = UIImageView.new.tap do |iv|
      iv.frame = [[214, 100], [86, 86]]
      iv.backgroundColor = UIColor.blueColor
    end)
  end

  def viewDidAppear(animated)
    super
  end
end