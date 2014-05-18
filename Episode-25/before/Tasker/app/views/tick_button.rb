class TickButton < UIButton
  def init
    super
    
    self.addSubview(@image_view = UIImageView.new)

    @image_view.frame = [[12, 12], [20, 20]]

    @image_view.layer.cornerRadius = 10
    @image_view.layer.borderColor = UIColor.purpleColor.CGColor
    @image_view.layer.borderWidth = 2.0

    self
  end

  def configure(data = {})
    if data[:complete]
      @image_view.image = UIImage.imageNamed("PurpleTick")
    else
      @image_view.image = nil
    end
  end
end