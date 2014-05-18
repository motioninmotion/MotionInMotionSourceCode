class AttributedTextView < UIScrollView
  def init
    super

    setBackgroundColor UIColor.whiteColor

    addSubview(@font_label = UILabel.new)
    addSubview(@paragraph_label = UILabel.new)
    addSubview(@foreground_color_label = UILabel.new)
    addSubview(@background_color_label = UILabel.new)
    addSubview(@kern_label = UILabel.new)
    addSubview(@strikethrough_label = UILabel.new)
    addSubview(@strikethrough_color_label = UILabel.new)
    addSubview(@underline_label = UILabel.new)
    addSubview(@underline_color_label = UILabel.new)
    addSubview(@stroked_label = UILabel.new)
    addSubview(@shadow_label = UILabel.new)
    addSubview(@multi_label = UILabel.new)
    addSubview(@all_label = UILabel.new)

    configure

    self
  end

  def configure
    @font_label.attributedText = NSAttributedString.alloc.initWithString(
      'Setting a font',
      attributes: { NSFontAttributeName => UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline) }
    )

    @paragraph_label.attributedText = NSAttributedString.alloc.initWithString(
      'Styling paragraphs can be fun, you should definitely try it',
      attributes: {
        NSParagraphStyleAttributeName => NSMutableParagraphStyle.new.tap do |ps|
          ps.lineHeightMultiple = 1.5
        end
      }
    )

    @foreground_color_label.attributedText = NSAttributedString.alloc.initWithString(
      'Light Blue Label',
      attributes: { NSForegroundColorAttributeName => UIColor.colorWithRed(0.35, green:0.49, blue:0.93, alpha:1) }
    )

    @background_color_label.attributedText = NSAttributedString.alloc.initWithString(
      'Light Blue Background',
      attributes: { NSBackgroundColorAttributeName => UIColor.colorWithRed(0.35, green:0.49, blue:0.93, alpha:1) }
    )

    @kern_label.attributedText = NSAttributedString.alloc.initWithString(
      'Spaced out letters',
      attributes: { NSKernAttributeName => 3 }
    )

    @strikethrough_label.attributedText = NSAttributedString.alloc.initWithString(
      'This text is no more!',
      attributes: { NSStrikethroughStyleAttributeName => NSUnderlineStyleSingle }
    )

    @strikethrough_color_label.attributedText = NSAttributedString.alloc.initWithString(
      'This text is no more!',
      attributes: {
        NSStrikethroughStyleAttributeName => NSUnderlineStyleSingle,
        NSStrikethroughColorAttributeName => UIColor.redColor
      }
    )

    @underline_label.attributedText = NSAttributedString.alloc.initWithString(
      'This text is no more!',
      attributes: { NSUnderlineStyleAttributeName => NSUnderlineStyleSingle }
    )

    @underline_color_label.attributedText = NSAttributedString.alloc.initWithString(
      'This text is no more!',
      attributes: {
        NSUnderlineStyleAttributeName => NSUnderlineStyleSingle,
        NSUnderlineColorAttributeName => UIColor.redColor
      }
    )

    @stroked_label.attributedText = NSAttributedString.alloc.initWithString(
      'Stroke me',
      attributes: {
        NSStrokeColorAttributeName => UIColor.redColor,
        NSStrokeWidthAttributeName => -3,
        NSForegroundColorAttributeName => UIColor.blueColor,
        NSFontAttributeName => UIFont.systemFontOfSize(48)
      }
    )

    @shadow_label.attributedText = NSAttributedString.alloc.initWithString(
      'Throw in a drop shadow',
      attributes: {
        NSShadowAttributeName => NSShadow.new.tap do |shadow|
          shadow.shadowOffset = [3, 3]
          shadow.shadowBlurRadius = 3
          shadow.shadowColor = UIColor.redColor
        end
      }
    )

    multi_text = NSMutableAttributedString.alloc.initWithString('Bold Italic Red Strikethrough Underline')

    multi_text.addAttributes({
      NSFontAttributeName => UIFont.boldSystemFontOfSize(UIFont.labelFontSize)
    }, range: [multi_text.mutableString.index('Bold'), 4])

    multi_text.addAttributes({
      NSFontAttributeName => UIFont.italicSystemFontOfSize(UIFont.labelFontSize)
    }, range: [multi_text.mutableString.index('Italic'), 6])

    multi_text.addAttributes({
      NSForegroundColorAttributeName => UIColor.redColor
    }, range: [multi_text.mutableString.index('Red'), 3])

    multi_text.addAttributes({
      NSStrikethroughStyleAttributeName => NSUnderlineStyleSingle
    }, range: [multi_text.mutableString.index('Strikethrough'), 13])

    multi_text.addAttributes({
      NSUnderlineStyleAttributeName => NSUnderlineStyleSingle
    }, range: [multi_text.mutableString.index('Underline'), 9])

    @multi_label.attributedText = multi_text

    all_text = NSMutableAttributedString.new
    subviews.each do |v|
      unless v == @all_label
        all_text.appendAttributedString(v.attributedText)
      end
    end

    @all_label.attributedText = all_text
  end

  def layout
    start_y = 40

    subviews.each do |v|
      v.frame = [[0, 0], [280, 0]]
      v.numberOfLines = 0
      v.textAlignment = NSTextAlignmentCenter
      v.sizeToFit
      v.center = [CGRectGetMidX(frame), start_y + CGRectGetHeight(v.frame) / 2]
      start_y = CGRectGetMaxY(v.frame) + 30
    end

    setContentSize([CGRectGetWidth(frame), CGRectGetMaxY(subviews.reverse.first.frame) + 40])
  end
end
