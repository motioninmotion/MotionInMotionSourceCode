class MainController < UIViewController
  def init
    super

    self.title = "Labels"

    rmq.stylesheet = MainStylesheet

    self
  end

  def loadView
    self.view = UIScrollView.new
    rmq(self.view).style { |st| st.background_color = rmq.color.white }
    rmq(self.view).append(UIView).tag(:container)

    (20 + rand(30)).times do |n|
      rmq(:container).append(UILabel, :big_label).style do |st|
        st.text = "Label ##{n}"
        st.top = n * 60 + 20
      end
    end
  end
end