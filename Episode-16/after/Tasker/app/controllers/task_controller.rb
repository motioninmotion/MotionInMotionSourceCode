class TaskController < UIViewController
  attr_accessor :task

  def loadView
    self.view = TaskView.new
  end

  def viewDidLoad
    super

    if self.task
      self.title = self.task.name
      self.view.name_field.text = self.task.name
      self.view.note_field.text = self.task.note
      self.view.date_picker.date = self.task.due_at
    else
      self.title = 'Add Task'
      self.navigationItem.rightBarButtonItem = UIBarButtonItem.alloc.initWithBarButtonSystemItem(
        UIBarButtonSystemItemSave,
        target:self,
        action:'done:'
      )
      self.view.date_picker.date = Time.now + (60 * 30)
    end
  end

  def viewWillDisappear(animated)
    update_task
  end

  # Actions

  def done(sender)
    self.dismissViewControllerAnimated(true, completion: nil)
  end

  private

  def update_task
    if self.task
      self.task.name = self.view.name_field.text
      self.task.note = self.view.note_field.text
      self.task.due_at = self.view.date_picker.date
    else
      Task.create(
        name: self.view.name_field.text,
        note: self.view.note_field.text,
        due_at: self.view.date_picker.date
      )
    end
    cdq.save
  end
end