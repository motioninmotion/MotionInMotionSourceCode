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
  end

  def will_appear
    set_attributes self.view, {
      background_color: hex_color("#FFFFFF")
    }
  end

  def open_help_screen
    open_modal HelpScreen.new(nav_bar: true)
  end

  def open_zaggle(args)
    open ZaggleScreen.new(zaggle_id: args[:zaggle_id])
  end

  def table_data
    [{
      cells: (0..200).map do |n|
        {
          title: "Zaggle #{n}",
          subtitle: "Zaggle Content",
          action: :open_zaggle,
          arguments: { zaggle_id: n }
        }
      end
    }]
  end

  def on_refresh
    end_refreshing
  end
end