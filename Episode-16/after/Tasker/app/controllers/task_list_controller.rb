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

    error_ptr = Pointer.new(:object)
    fetch_controller.delegate = self
    unless fetch_controller.performFetch(error_ptr)
      raise "Error performing fetch: #{error_ptr[2].description}"
    end

    NSNotificationCenter.defaultCenter.addObserver(
      self,
      selector:'context_did_save:',
      name: NSManagedObjectContextDidSaveNotification,
      object: nil
    )
  end

  def viewDidUnload
    super
    @fetch_controller = nil
  end

  # UITableViewDataSource methods

  def tableView(_, numberOfRowsInSection: section)
    fetch_controller.sections[section].numberOfObjects
  end

  def tableView(table_view, cellForRowAtIndexPath: index_path)
    @cell_id = "TaskCell"

    cell = table_view.dequeueReusableCellWithIdentifier(@cell_id) || begin
      UITableViewCell.alloc.initWithStyle(UITableViewCellStyleSubtitle, reuseIdentifier: @cell_id)
    end

    cell.textLabel.text = fetch_controller.objectAtIndexPath(index_path).name
    cell.detailTextLabel.text = NSDateFormatter.localizedStringFromDate(
      fetch_controller.objectAtIndexPath(index_path).due_at,
      dateStyle:NSDateFormatterShortStyle,
      timeStyle:NSDateFormatterShortStyle
    )
    cell.selectionStyle = UITableViewCellSelectionStyleNone

    cell
  end

  # UITableViewDelegate methods

  def tableView(_, editingStyleForRowAtIndexPath: _)
    UITableViewCellEditingStyleDelete
  end

  def tableView(_, canEditRowAtIndexPath: _)
    true
  end

  def tableView(_, commitEditingStyle: _, forRowAtIndexPath: index_path)
    fetch_controller.objectAtIndexPath(index_path).destroy
  end

  def tableView(_, didSelectRowAtIndexPath: index_path)
    vc = TaskController.new
    vc.task = fetch_controller.objectAtIndexPath(index_path)
    self.navigationController.pushViewController(vc, animated: true)
  end

  # NSFetchedResultsControllerDelegate methods

  def controllerWillChangeContent(_)
    view.beginUpdates
  end

  def controller(_, didChangeObject: _, atIndexPath: index_path, forChangeType: change_type, newIndexPath: new_index_path)
    case change_type
      when NSFetchedResultsChangeInsert
        view.insertRowsAtIndexPaths([new_index_path], withRowAnimation: UITableViewRowAnimationAutomatic)
      when NSFetchedResultsChangeDelete
        view.deleteRowsAtIndexPaths([index_path], withRowAnimation: UITableViewRowAnimationAutomatic)
      when NSFetchedResultsChangeUpdate
        view.reloadRowsAtIndexPaths([index_path], withRowAnimation: UITableViewRowAnimationAutomatic)
    end
  end

  def controllerDidChangeContent(_)
    view.endUpdates
  end

  # Actions

  def add_task(_)
    self.presentViewController(
      UINavigationController.alloc.initWithRootViewController(TaskController.new),
      animated: true,
      completion: nil
    )
  end

  # Notification Handlers

  def context_did_save(notification)
    Dispatch::Queue.main.async do
      fetch_controller.managedObjectContext.mergeChangesFromContextDidSaveNotification(notification)
    end
  end

  private

  def fetch_controller
    @tasks ||= Task.all.sort_by(:due_at)
    @fetch_controller ||= NSFetchedResultsController.alloc.initWithFetchRequest(
      @tasks.fetch_request,
      managedObjectContext: @tasks.context,
      sectionNameKeyPath: nil,
      cacheName: nil
    )
  end

end