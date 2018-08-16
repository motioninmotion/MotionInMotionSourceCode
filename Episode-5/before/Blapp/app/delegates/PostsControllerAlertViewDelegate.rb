module PostsControllerAlertViewDelegate
  def configure_post(title, post=nil) #post = nil if creating a post
    if post
      self.posts[post][:title] = title
      self.tableView.reloadRowsAtIndexPaths([NSIndexPath.indexPathForRow(post + 1, inSection:0)], withRowAnimation: UITableViewRowAnimationFade)
    else
      self.posts << {title: title, content: ""}
      self.tableView.insertRowsAtIndexPaths([NSIndexPath.indexPathForRow(self.posts.count, inSection:0)], withRowAnimation:UITableViewRowAnimationTop)
    end
  end
end
