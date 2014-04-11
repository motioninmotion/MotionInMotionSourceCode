class TaskListController < UITableViewController

  def init
    super.tap do |c|
      c.title = "Tasks"
      c.navigationItem.leftBarButtonItem = UIBarButtonItem.alloc.initWithBarButtonSystemItem(UIBarButtonSystemItemRefresh,
        target: self,
        action: 'refresh:'
      )
      c.navigationItem.rightBarButtonItem = UIBarButtonItem.alloc.initWithBarButtonSystemItem(UIBarButtonSystemItemAdd,
        target: self,
        action: 'add_task:'
      )
    end
  end

  def viewDidLoad
    super

    self.view.registerClass(TaskCell, forCellReuseIdentifier: "TaskCell")
    self.view.separatorInset = UIEdgeInsetsZero

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

  def tableView(table_view, numberOfRowsInSection: section)
    fetch_controller.sections[section].numberOfObjects
  end

  def tableView(table_view, cellForRowAtIndexPath: index_path)
    @cell_id = "TaskCell"

    cell = table_view.dequeueReusableCellWithIdentifier(@cell_id)

    cell.configure({
      name: fetch_controller.objectAtIndexPath(index_path).name,
      due_at: fetch_controller.objectAtIndexPath(index_path).due_at,
      has_note: fetch_controller.objectAtIndexPath(index_path).note != "",
      complete: fetch_controller.objectAtIndexPath(index_path).complete
    })

    cell.tick_button.tag = index_path.row
    cell.tick_button.addTarget(self, action: 'complete_task:', forControlEvents: UIControlEventTouchUpInside)

    cell
  end

  # UITableViewDelegate methods

  def tableView(table_view, editingStyleForRowAtIndexPath: index_path)
    UITableViewCellEditingStyleDelete
  end

  def tableView(table_view, canEditRowAtIndexPath: index_path)
    true
  end

  def tableView(table_view, commitEditingStyle: editing_style, forRowAtIndexPath: index_path)
    DeleteTaskCommand.new(fetch_controller.objectAtIndexPath(index_path)).run
  end

  def tableView(table_view, didSelectRowAtIndexPath: index_path)
    vc = TaskController.new
    vc.task = fetch_controller.objectAtIndexPath(index_path)
    self.navigationController.pushViewController(vc, animated: true)
  end

  def tableView(table_view, heightForRowAtIndexPath: index_path)
    content = TaskCell.new

    content.configure({
      name: fetch_controller.objectAtIndexPath(index_path).name,
      due_at: fetch_controller.objectAtIndexPath(index_path).due_at,
      has_note: fetch_controller.objectAtIndexPath(index_path).note != "",
      complete: fetch_controller.objectAtIndexPath(index_path).complete
    })
    content.layoutIfNeeded

    content.current_height_for_width(CGRectGetWidth(table_view.frame))
  end

  # NSFetchedResultsControllerDelegate methods

  def controllerWillChangeContent(controller)
    view.beginUpdates
  end

  def controller(controller, didChangeObject: task, atIndexPath: index_path, forChangeType: change_type, newIndexPath: new_index_path)
    case change_type
      when NSFetchedResultsChangeInsert
        view.insertRowsAtIndexPaths([new_index_path], withRowAnimation: UITableViewRowAnimationAutomatic)
      when NSFetchedResultsChangeDelete
        view.deleteRowsAtIndexPaths([index_path], withRowAnimation: UITableViewRowAnimationAutomatic)
      when NSFetchedResultsChangeUpdate
        view.reloadRowsAtIndexPaths([index_path], withRowAnimation: UITableViewRowAnimationAutomatic)
      when NSFetchedResultsChangeMove
        view.insertRowsAtIndexPaths([new_index_path], withRowAnimation: UITableViewRowAnimationAutomatic)
        view.deleteRowsAtIndexPaths([index_path], withRowAnimation: UITableViewRowAnimationAutomatic)
    end
  end

  def controllerDidChangeContent(controller)
    view.endUpdates
  end

  # Actions

  def add_task(sender)
    self.presentViewController(
      UINavigationController.alloc.initWithRootViewController(TaskController.new),
      animated: true,
      completion: nil
    )
  end

  def refresh(sender)
    LoadTasksCommand.run
  end

  def complete_task(sender)
    task = fetch_controller.objectAtIndexPath(NSIndexPath.indexPathForRow(sender.tag, inSection: 0))
    CompleteTaskCommand.new(task).run
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
