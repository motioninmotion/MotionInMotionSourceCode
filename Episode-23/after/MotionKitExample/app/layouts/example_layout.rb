class ExampleLayout < MotionKit::Layout
  def layout
    background_color UIColor.whiteColor

    add UIView, :header do
      background_color UIColor.darkGrayColor

      add UILabel, :header_title do
        text 'Welcome'
        text_alignment UITextAlignmentCenter
        text_color UIColor.whiteColor
      end
    end

    add UIView, :main do
      background_color UIColor.grayColor

      add UILabel, :main_text do
        text 'This is the main text in our example layout. Do you like how the views can stretch and shrink and reflow? I did this using motion-kit'
        text_alignment UITextAlignmentCenter
        text_color UIColor.whiteColor
        target.numberOfLines = 0
      end
    end

    add UIView, :footer_left do
      background_color UIColor.lightGrayColor
    end

    add UIView, :footer_right do
      background_color UIColor.lightGrayColor
    end
  end

  def add_constraints
    constraints(:header) do
      top_left x: 20, y: 40
      width.equals(view).minus(40)
      height 50
    end

    constraints(:header_title) do
      top_left x: 10, y: 10
      width.equals(:header).minus(20)
      height.equals(:header).minus(20)
    end

    constraints(:main) do
      top.equals(:header, NSLayoutAttributeBottom).plus(20)
      left 20
      width.equals(:header)
      bottom.equals(:footer_left, NSLayoutAttributeTop).minus(20)
    end

    constraints(:main_text) do
      top_left x: 10, y: 10
      width.equals(:main).minus(20)
      height.equals(:main).minus(20)
    end

    constraints(:footer_left) do
      bottom.equals(view).minus(20)
      left 20
      width.equals(:header).divided_by(2).minus(10)
      height 50
    end

    constraints(:footer_right) do
      bottom.equals(:footer_left)
      left.equals(:footer_left, NSLayoutAttributeRight).plus(20)
      width.equals(:footer_left)
      height.equals(:footer_left)
    end
  end
end
