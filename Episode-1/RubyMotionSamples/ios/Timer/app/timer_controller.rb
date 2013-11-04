class TimerController < UIViewController
  attr_reader :timer

  def viewDidLoad
    @state = UILabel.new
    @state.font = UIFont.systemFontOfSize(30)
    @state.text = 'Tap to start'
    @state.textAlignment = UITextAlignmentCenter
    @state.textColor = UIColor.whiteColor
    @state.backgroundColor = UIColor.clearColor

    @action = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    @action.setTitle('Start', forState:UIControlStateNormal)
    @action.setTitle('Stop', forState:UIControlStateSelected)
    @action.addTarget(self, action:'actionTapped', forControlEvents:UIControlEventTouchUpInside)

    Motion::Layout.new do |layout|
      layout.view view
      layout.subviews "state" => @state, "action" => @action
      layout.metrics "margin" => 20, "height" => 40, "portraitTopMargin" => ((view.frame.size.height - 100) / 2), "landscapeBottomMargin" => ((view.frame.size.width - 100) / 2)
      layout.vertical "|-(<=portraitTopMargin)-[state]-margin-[action]-(>=landscapeBottomMargin)-|"
      layout.horizontal "|-margin-[state]-margin-|"
      layout.horizontal "|-margin-[action]-margin-|"
    end
  end

  def actionTapped
    if @timer
      @timer.invalidate
      @timer = nil
    else
      @duration = 0
      @timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target:self, selector:'timerFired', userInfo:nil, repeats:true)
    end
    @action.selected = !@action.selected?
  end

  def timerFired
    @state.text = "%.1f" % (@duration += 0.1)
  end
end
