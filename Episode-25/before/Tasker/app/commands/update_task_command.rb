class UpdateTaskCommand
  def initialize(task, task_attributes = {})
    @task = task
    @task_attributes = task_attributes
  end

  def run
    SVProgressHUD.showWithStatus('Saving Task')

    @task.name = @task_attributes[:name]
    @task.note = @task_attributes[:note]
    @task.due_at = @task_attributes[:due_at]
    @task.update_alert

    Dispatch::Queue.concurrent(:default).async do
      RemoteManager.object_manager.patchObject(
        @task,
        path: "tasks/#{@task.task_id}.json",
        parameters: nil,
        success: ->(operation, mapping_result) {
          SVProgressHUD.dismiss
        },
        failure: ->(operation, error) {
          fail "restkit died"
        }
      )
    end

  end
end
