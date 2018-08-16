class TaskListController < UITableViewController

  def init
    super.tap do |c|
      c.title = "Tasks"
      c.navigationItem.rightBarButtonItem = UIBarButtonItem.alloc.initWithBarButtonSystemItem(UIBarButtonSystemItemAdd,
        target: self,
        action: 'add_task:'
      )
    end
  end

  def viewDidLoad
    super
  end

  def viewDidUnload
    super
    @fetch_controller = nil
  end

  # UITableViewDataSource methods

  def tableView(_, numberOfRowsInSection: _)
    0
  end

  # Actions

  def add_task(_)
    self.presentViewController(
      UINavigationController.alloc.initWithRootViewController(TaskController.new),
      animated: true,
      completion: nil
    )
  end

end