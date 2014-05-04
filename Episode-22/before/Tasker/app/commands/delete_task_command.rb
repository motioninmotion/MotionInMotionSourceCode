class DeleteTaskCommand
  def initialize(task)
    @task = task
  end

  def run
    SVProgressHUD.showWithStatus('Deleting Task')
    Dispatch::Queue.concurrent(:default).async do
      RemoteManager.object_manager.deleteObject(
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