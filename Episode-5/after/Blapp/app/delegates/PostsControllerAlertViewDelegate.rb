module PostsControllerAlertViewDelegate

  def alertView(alertView, didDismissWithButtonIndex:buttonIndex)
    if alertView.buttonTitleAtIndex(buttonIndex) == "Continue"
      if alertView.title == "Post Title"
        self.posts << {title: alertView.textFieldAtIndex(0).text, content: ""}
        self.tableView.insertRowsAtIndexPaths([NSIndexPath.indexPathForRow(self.posts.count, inSection:0)], withRowAnimation:UITableViewRowAnimationTop)
      elsif alertView.title == "Edit Post Title"
        self.posts[alertView.tag][:title] = alertView.textFieldAtIndex(0).text
        self.tableView.reloadRowsAtIndexPaths([NSIndexPath.indexPathForRow(alertView.tag + 1, inSection:0)], withRowAnimation:UITableViewRowAnimationFade)
      end
    end
  end

end
