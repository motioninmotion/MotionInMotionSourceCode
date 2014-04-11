class LoadTasksCommand
  def self.run
    SVProgressHUD.showWithStatus('Loading Tasks')
    Dispatch::Queue.concurrent(:default).async do
      RemoteManager.object_manager.getObjectsAtPath(
        'tasks.json',
        parameters: nil,
        success: ->(operation, mapping_result) {
          Task.all.each do |task|
            unless mapping_result.array.include? task
              task.destroy
            end
          end
          SVProgressHUD.dismiss
        },
        failure: ->(operation, error) {
          fail "restkit failed to load tasks"
        }
      )
    end
  end
end