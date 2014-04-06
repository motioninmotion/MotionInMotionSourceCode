class TaskCell < UITableViewCell
#   attr_reader :name_label, :due_at_label, :tick_button

#   TOP_BOTTOM_PADDING = 12
#   DUE_AT_HEIGHT = 13
#   NAME_AND_DUE_AT_PADDING = 7
#   NAME_RIGHT_PADDING_NO_NOTES = 12
#   NAME_LEFT_PADDING = 48
#   NOTES_WIDTH = 19
#   NOTES_PADDING = 16

#   def initWithStyle(style, reuseIdentifier: reuse_identifier)
#     super

#     self.selectionStyle = UITableViewCellSelectionStyleNone

#     self.contentView.addSubview(@tick_button = TickButton.new)
#     self.contentView.addSubview(@name_label = NameLabel.new)
#     self.contentView.addSubview(@due_at_label = DueAtLabel.new)
#     self.contentView.addSubview(@notes_indicator = NotesIndicator.new)

#     @tick_button.setTranslatesAutoresizingMaskIntoConstraints(false)
#     @name_label.setTranslatesAutoresizingMaskIntoConstraints(false)
#     @due_at_label.setTranslatesAutoresizingMaskIntoConstraints(false)
#     @notes_indicator.setTranslatesAutoresizingMaskIntoConstraints(false)

#     self
#   end

#   def configure(data = {})
#     self.contentView.subviews.each do |sv|
#       sv.configure(data)
#     end
#     self.setNeedsUpdateConstraints
#     self.setNeedsLayout
#   end

#   def updateConstraints
#     super

#     if @constraints
#       self.contentView.removeConstraints(@constraints.flatten)
#     end

#     @constraints = []

#     @constraints << NSLayoutConstraint.constraintsWithVisualFormat(
#       'V:|-7-[tick(44)]',
#       options: NSLayoutFormatDirectionLeadingToTrailing,
#       metrics: nil,
#       views: {'tick' => @tick_button}
#     )
#     @constraints << NSLayoutConstraint.constraintsWithVisualFormat(
#       'H:|-1-[tick(44)]',
#       options: NSLayoutFormatDirectionLeadingToTrailing,
#       metrics: nil,
#       views: {'tick' => @tick_button}
#     )
#     @constraints << NSLayoutConstraint.constraintsWithVisualFormat(
#       'V:|-top_padding-[name]',
#       options: NSLayoutFormatDirectionLeadingToTrailing,
#       metrics: {'top_padding' => TOP_BOTTOM_PADDING},
#       views: {'name' => @name_label}
#     )
#     @constraints << NSLayoutConstraint.constraintsWithVisualFormat(
#       'H:[tick]-1-[name]',
#       options: NSLayoutFormatDirectionLeadingToTrailing,
#       metrics: nil,
#       views: {'name' => @name_label, 'tick' => @tick_button}
#     )
#     @constraints << NSLayoutConstraint.constraintsWithVisualFormat(
#       'V:[name]-name_and_due_at_padding-[due_at(==due_at_height)]-bottom_padding-|',
#       options: NSLayoutFormatAlignAllCenterX,
#       metrics: {'name_and_due_at_padding' => NAME_AND_DUE_AT_PADDING, 'due_at_height' => DUE_AT_HEIGHT, 'bottom_padding' => TOP_BOTTOM_PADDING},
#       views: {'name' => @name_label, 'due_at' => @due_at_label}
#     )
#     @constraints << NSLayoutConstraint.constraintsWithVisualFormat(
#       'H:[due_at(==name)]',
#       options: NSLayoutFormatDirectionLeadingToTrailing,
#       metrics: nil,
#       views: {'name' => @name_label, 'due_at' => @due_at_label}
#     )
#     @constraints << NSLayoutConstraint.constraintsWithVisualFormat(
#       'V:|-16-[notes(==26)]',
#       options: NSLayoutFormatDirectionLeadingToTrailing,
#       metrics: nil,
#       views: {'notes' => @notes_indicator}
#     )
#     @constraints << NSLayoutConstraint.constraintsWithVisualFormat(
#       'H:[notes(==width)]-padding-|',
#       options: NSLayoutFormatDirectionLeadingToTrailing,
#       metrics: {'padding' => NOTES_PADDING, 'width' => NOTES_WIDTH},
#       views: {'notes' => @notes_indicator}
#     )
#     @constraints << NSLayoutConstraint.constraintsWithVisualFormat(
#       'H:[name]-right_padding-|',
#       options: NSLayoutFormatDirectionLeadingToTrailing,
#       metrics: {'right_padding' => self.name_right_padding},
#       views: {'notes' => @notes_indicator, 'name' => @name_label}
#     )

#     self.contentView.addConstraints(@constraints.flatten)
#   end

#   def current_height_for_width(width)
#     name_height = @name_label.text.boundingRectWithSize(
#       [width - NAME_LEFT_PADDING - self.name_right_padding, 0],
#       options: NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin,
#       attributes: {NSFontAttributeName => @name_label.font}, 
#       context: nil
#     ).size.height
#     TOP_BOTTOM_PADDING + name_height + NAME_AND_DUE_AT_PADDING + DUE_AT_HEIGHT + TOP_BOTTOM_PADDING + 0.5
#   end

#   def name_right_padding
#     @notes_indicator.image ? NOTES_PADDING * 2 + NOTES_WIDTH : NAME_RIGHT_PADDING_NO_NOTES
#   end
end