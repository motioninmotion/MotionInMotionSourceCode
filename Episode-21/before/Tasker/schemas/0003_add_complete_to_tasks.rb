schema "0003 add complete to tasks" do
  entity "Task" do
    string :name, optional: false
    string :note
    datetime :due_at, optional: false
    integer32 :task_id
    boolean :complete
  end
end