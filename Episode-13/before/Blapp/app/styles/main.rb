Teacup::Stylesheet.new :main do

  style :post_view,
    background: :light_gray,
    constraints: [
      constrain_left(0),
      constrain_top(0),
      constrain(:width).equals(:superview, :width),
      constrain(:height).equals(:superview, :height)
    ]

    # left: 0, top: 0, width: '100%', height: '100% - 150',
  style :content_view,
    textContainerInset: UIEdgeInsetsMake(20, 20, 20, 20),
    editable: false,
    textContainer: {
      lineFragmentPadding: 0.0
    },
    constraints: [
      constrain_left(0),
      constrain_top(0),
      constrain(:width).equals(:superview, :width),
      constrain(:height).equals(:superview, :height).minus(150)
    ]

    # left: 20, top: '100% - 150', width: '100% - 40', height: 30,
  style :author_label,
    font: :bold.uifont(15),
    constraints: [
      constrain_left(20),
      constrain(:top).equals(:content_view, :bottom),
      constrain(:width).equals(:superview, :width).minus(40),
      constrain_height(30)
    ]

    # left: 0, top: '100% - 120', width: '100%', height: 100,
  style :author_bio,
    editable: false,
    textContainerInset: UIEdgeInsetsMake(0, 20, 0, 20),
    background: :clear,
    textContainer: {
      lineFragmentPadding: 0.0
    },
    constraints: [
      constrain_left(0),
      constrain(:top).equals(:author_label, :bottom),
      constrain(:width).equals(:superview, :width),
      constrain_height(100)
    ]

end