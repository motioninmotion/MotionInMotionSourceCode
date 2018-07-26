module PostsControllerTableViewDelegate

  def tableView(tableView, didSelectRowAtIndexPath:indexPath)
    tableView.deselectRowAtIndexPath(indexPath, animated:true)

    if indexPath.row == 0
      alert = UIAlertController.alertControllerWithTitle('Post Title',
                                                         message: 'Enter a title for your Blapp post',
                                                         preferredStyle: UIAlertControllerStyleAlert)
      cancel_action = UIAlertAction.actionWithTitle('Cancel', style: UIAlertActionStyleCancel, handler: nil)
      continue_action = UIAlertAction.actionWithTitle('Continue', style: UIAlertActionStyleDefault, handler: lambda { |_| create_new_post(alert.textFields[0].text)})
      alert.addTextFieldWithConfigurationHandler(lambda {|_|})
      alert.addAction(cancel_action)
      alert.addAction(continue_action)
      presentViewController(alert, animated: true, completion: nil)
    else
      self.navigationController.pushViewController(PostDetailController.alloc.initWithPost(Post.all[indexPath.row - 1]), animated:true)
    end
  end

  def tableView(tableView, accessoryButtonTappedForRowWithIndexPath:indexPath)
    alert = UIAlertController.alertControllerWithTitle('Edit Post Title',
                                                       message: 'Enter a title for your Blapp post',
                                                       preferredStyle: UIAlertControllerStyleAlert)
    cancel_action = UIAlertAction.actionWithTitle('Cancel', style: UIAlertActionStyleCancel, handler: nil)
    continue_action = UIAlertAction.actionWithTitle('Continue', style: UIAlertActionStyleDefault, handler: lambda { |_| update_post(indexPath.row - 1, with_title: alert.textFields[0].text)})
    alert.addTextFieldWithConfigurationHandler(lambda {|text_field| text_field.text = Post.all[indexPath.row - 1].title})
    alert.addAction(cancel_action)
    alert.addAction(continue_action)
    presentViewController(alert, animated: true, completion: nil)
  end

end