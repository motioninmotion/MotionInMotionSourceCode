module PostsControllerTableViewDataSource

  def tableView(tableView, numberOfRowsInSection:section)
    Post.count + 1
  end

  def tableView(tableView, cellForRowAtIndexPath: indexPath)
    if indexPath.row == 0
      cell = tableView.dequeueReusableCellWithIdentifier("NewPostCell") || begin
        UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:"NewPostCell")
      end

      cell.textLabel.text = "Create a new post"
    else
      @reuseIdentifier ||= "PostCell"

      cell = tableView.dequeueReusableCellWithIdentifier(@reuseIdentifier) || begin
        UITableViewCell.alloc.initWithStyle(UITableViewCellStyleSubtitle, reuseIdentifier:@reuseIdentifier)
      end

      cell.textLabel.text = Post.all[indexPath.row - 1].title
      cell.detailTextLabel.text = Post.all[indexPath.row - 1].content
      cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton
    end

    cell
  end

  def tableView(tableView, canEditRowAtIndexPath:indexPath)
    indexPath.row != 0
  end

  def tableView(tableView, commitEditingStyle:editingStyle, forRowAtIndexPath:indexPath)
    Post.all[indexPath.row - 1].destroy
    cdq.save
    tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation:UITableViewRowAnimationBottom)
  end

end
