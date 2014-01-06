class TodoListController < UITableViewController
  attr_accessor :todoListManager

  def init
    super
    self.title = "Todos"
    self.todoListManager = TodoListManager.new
    self
  end

  def tableView(tableView, numberOfRowsInSection:section)
    self.todoListManager.todos.count
  end

  def tableView(tableView, cellForRowAtIndexPath: indexPath)
    @reuseIdentifier ||= "TodoCell"

    cell = tableView.dequeueReusableCellWithIdentifier(@reuseIdentifier) || begin
      UITableViewCell.alloc.initWithStyle(UITableViewCellStyleSubtitle, reuseIdentifier:@reuseIdentifier)
    end

    cell.textLabel.text = self.todoListManager.todos[indexPath.row].title
    cell.detailTextLabel.text = self.todoListManager.todos[indexPath.row].completed ? "Complete" : "Incomplete"

    cell
  end

end
