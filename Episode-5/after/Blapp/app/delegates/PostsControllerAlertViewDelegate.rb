module PostsControllerAlertViewDelegate

  def alertView(alertView, didDismissWithButtonIndex:buttonIndex)
    if alertView.buttonTitleAtIndex(buttonIndex) == "Continue"
      if alertView.title == "Post Title"
        Post.create({title: alertView.textFieldAtIndex(0).text, content: "", created_at: Time.now, updated_at: Time.now, pseudonym: Pseudonym.first})
        cdq.save
        self.tableView.insertRowsAtIndexPaths([NSIndexPath.indexPathForRow(Post.count, inSection:0)], withRowAnimation:UITableViewRowAnimationTop)
      elsif alertView.title == "Edit Post Title"
        Post.all[alertView.tag].title = alertView.textFieldAtIndex(0).text
        Post.all[alertView.tag].updated_at = Time.now
        cdq.save
        self.tableView.reloadRowsAtIndexPaths([NSIndexPath.indexPathForRow(alertView.tag + 1, inSection:0)], withRowAnimation:UITableViewRowAnimationFade)
      end
    end
  end

end
