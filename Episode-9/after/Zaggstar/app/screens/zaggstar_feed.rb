class ZaggstarFeed < PM::TableScreen
  title "Zaggstar Feed"

  searchable placeholder: "Find a Zaggle"
  refreshable callback: :on_refresh,
              pull_message: "Pull to resfresh",
              refreshing: "Refresing data…",
              updated_format: "Last updated at %s",
              updated_time_format: "%l:%M %p"

  def on_load
    set_nav_bar_button :left, title: "Help", action: :open_help_screen
    set_nav_bar_button :right, system_item: :add, action: :open_add_zaggle_form
  end

  def will_appear
    update_table_data
    set_attributes self.view, {
      background_color: hex_color("#FFFFFF")
    }
  end

  def open_help_screen
    open_modal HelpScreen.new(nav_bar: true)
  end

  def open_add_zaggle_form
    open_modal AddZaggleForm.new(nav_bar: true)
  end

  def open_zaggle(args)
    open ZaggleScreen.new(zaggle_id: args[:zaggle_id])
  end

  def table_data
    [{
      cells: app_delegate.zaggles.map do |zaggle|
        {
          title: zaggle[:title],
          subtitle: zaggle[:content],
          action: :open_zaggle,
          editing_style: :delete,
          arguments: { zaggle_id: app_delegate.zaggles.index(zaggle) }
        }
      end
    }]
  end

  def on_cell_deleted(cell)
    app_delegate.zaggles.delete_at(cell[:arguments][:zaggle_id])
  end

  def on_refresh
    end_refreshing
  end
end
