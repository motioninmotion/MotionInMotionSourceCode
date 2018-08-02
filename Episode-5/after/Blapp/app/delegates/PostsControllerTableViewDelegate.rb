module PostsControllerTableViewDelegate

  def tableView(tableView, didSelectRowAtIndexPath:indexPath)
    tableView.deselectRowAtIndexPath(indexPath, animated:true)

    if indexPath.row == 0
      gather_post_input
    else
      self.navigationController.pushViewController(PostDetailController.alloc.initWithPost(Post.all[indexPath.row - 1]), animated:true)
    end
  end

  def tableView(tableView, accessoryButtonTappedForRowWithIndexPath:indexPath)
    gather_post_input(indexPath.row - 1)
  end

  def gather_post_input(row = nil)
    alert = UIAlertController.alertControllerWithTitle(row ? 'Edit Post Title' : 'Post Title',
                                                       message: 'Enter a title for your Blapp post',
                                                       preferredStyle: UIAlertControllerStyleAlert)
    cancel_action = UIAlertAction.actionWithTitle('Cancel', style: UIAlertActionStyleCancel, handler: nil)
    continue_handler = lambda { |_| configure_post(alert.textFields[0].text, row)}
    configuration_handler = row ? lambda {|text_field| text_field.text = Post.all[row].title} : lambda {|_|}
    continue_action = UIAlertAction.actionWithTitle('Continue', style: UIAlertActionStyleDefault, handler: continue_handler)
    alert.addTextFieldWithConfigurationHandler(configuration_handler)
    alert.addAction(cancel_action)
    alert.addAction(continue_action)
    presentViewController(alert, animated: true, completion: nil)
  end

end