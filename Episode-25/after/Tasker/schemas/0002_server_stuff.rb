schema "0001 initial" do
  entity "Task" do
    string :name, optional: false
    string :note
    datetime :due_at, optional: false
    integer32 :task_id
  end
end