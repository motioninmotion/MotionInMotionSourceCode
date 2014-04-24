schema "0004 add notification to tasks" do
  entity "Task" do
    string :name, optional: false
    string :note
    datetime :due_at, optional: false
    integer32 :task_id
    boolean :complete
    transformable :notification
  end
end
