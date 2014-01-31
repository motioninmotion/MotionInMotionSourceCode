class ZaggleScreen < PM::Screen
  attr_accessor :zaggle_id

  def on_load
    self.title = "Zaggle ##{self.zaggle_id}"
  end

  def will_appear
    set_attributes self.view, {
      background_color: hex_color("#FFFFFF")
    }

    add UILabel.new, {
      text: "Zaggle Content",
      font: UIFont.systemFontOfSize(32),
      left: 20,
      top: 200,
      width: 280,
      height: 50,
      text_alignment: NSTextAlignmentCenter
    }
  end
end