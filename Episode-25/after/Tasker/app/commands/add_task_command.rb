class AddTaskCommand
  def initialize(task_attributes = {})
    @task_attributes = task_attributes
  end

  def run
    SVProgressHUD.showWithStatus('Saving task')
    task = Task.create(@task_attributes)
    task.update_alert
    Dispatch::Queue.concurrent(:default).async do
      RemoteManager.object_manager.postObject(
        task,
        path: 'tasks.json',
        parameters: nil,
        success: ->(operation, mapping_result) {
          SVProgressHUD.dismiss
        },
        failure: ->(operation, error) {
          fail "restkit failed to add task"
        }
      )
    end
  end
end
