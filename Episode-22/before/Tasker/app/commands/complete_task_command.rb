class CompleteTaskCommand
  def initialize(task)
    @task = task
  end

  def run
    SVProgressHUD.showWithStatus('Saving Task')

    @task.complete = @task.complete ? nil : true

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