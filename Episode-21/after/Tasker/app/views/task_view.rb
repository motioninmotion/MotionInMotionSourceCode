class TaskView < TPKeyboardAvoidingScrollView
  attr_accessor :name_field, :note_field, :date_field

  def init
    super

    @field_bar = MIMInputToolbar.new

    self.backgroundColor = UIColor.whiteColor

    self.name_field = TextField.new.tap do |v|
      v.frame = [[20, 20], [280, 40]]
      v.placeholder = "e.g. Do the dishes"
      v.inputAccessoryView = @field_bar
    end
    self.addSubview(self.name_field)

    @date_label = Label.new.tap do |v|
      v.frame = [[20, 80], [280, 0]]
      v.text = "Due At"
      v.sizeToFit
    end
    self.addSubview(@date_label)

    self.date_field = DateField.new.tap do |v|
      v.frame = [[20, CGRectGetMaxY(@date_label.frame) + 5], [280, 40]]
      v.inputAccessoryView = @field_bar
    end
    self.addSubview(self.date_field)

    @notes_label = Label.new.tap do |v|
      v.frame = [[20, CGRectGetMaxY(self.date_field.frame) + 20], [280, 0]]
      v.text = "Notes"
      v.sizeToFit
    end
    self.addSubview(@notes_label)

    self.note_field = UITextView.new.tap do |v|
      v.frame = [[20, CGRectGetMaxY(@notes_label.frame) + 5], [280, 100]]
      v.layer.borderWidth = 1
      v.layer.borderColor = UIColor.grayColor.CGColor
      v.layer.cornerRadius = 3
      v.font = UIFont.systemFontOfSize(14)
      v.textContainerInset = UIEdgeInsetsMake(10, 5, 10, 5)
      v.inputAccessoryView = @field_bar
    end
    self.addSubview(self.note_field)

    @field_bar.fields = [self.name_field, self.date_field, self.note_field]

    self
  end
end
