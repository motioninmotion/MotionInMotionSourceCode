class MainController < UIViewController
  def init
    super

    self.title = "Labels"

    rmq.stylesheet = MainStylesheet

    self.navigationItem.rightBarButtonItem = UIBarButtonItem.alloc.initWithTitle("Capture", style:UIBarButtonItemStylePlain, target:self, action:'capture_view:')

    self
  end

  def loadView
    self.view = UIScrollView.new
    rmq(self.view).style { |st| st.background_color = rmq.color.white }
    rmq(self.view).append(UIView).tag(:container)

    (20 + rand(30)).times do |n|
      rmq(:container).append(UILabel, :big_label).tag(theme: { type: :label }).style do |st|
        st.text = "Label ##{n}"
        st.top = n * 60 + 20
      end
    end

    rmq(:container).resize_to_fit_subviews
    rmq(self.view).attr(contentSize: [320, rmq(:container).get.frame.size.height + 20])
  end

  def capture_view(sender)
    UIImageWriteToSavedPhotosAlbum(rmq.image.from_view(self.view, true), nil, nil, nil)
  end
end