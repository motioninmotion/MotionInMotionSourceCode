class EditZaggleForm < PM::FormotionScreen
  attr_accessor :zaggle_id

  title "Edit Zaggle"

  def on_load
    set_nav_bar_button :left, title: "Cancel", action: :close_screen
  end

  def on_submit(form)
    data = form.render

    [['Title', :title], ['Content', :content]].each do |field|
      if data[field[1]].length > 20
        App.alert("#{field[0]} is too long")
        return
      elsif data[field[1]].length == 0
        App.alert("#{field[0]} is required")
      end
    end

    app_delegate.zaggles[self.zaggle_id] = data
    close
  end

  def close_screen
    close
  end

  def table_data
    {
      sections: [{
        rows: [{
          title: "Title",
          key: :title,
          placeholder: "20 characters max",
          type: :string,
          value: app_delegate.zaggles[self.zaggle_id][:title]
        }, {
          title: "Content",
          key: :content,
          placeholder: "20 characters max",
          type: :string,
          value: app_delegate.zaggles[self.zaggle_id][:content]
        }]
      }, {
        rows: [{
          title: "Update",
          type: :submit
        }]
      }]
    }
  end
end