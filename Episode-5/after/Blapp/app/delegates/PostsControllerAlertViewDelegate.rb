module PostsControllerAlertViewDelegate
  def configure_post(title, post=nil)
    if post
      Post.all[post].title = title
      Post.all[post].updated_at = Time.now
      cdq.save
      self.tableView.reloadRowsAtIndexPaths([NSIndexPath.indexPathForRow(post + 1, inSection:0)], withRowAnimation: UITableViewRowAnimationFade)
    else
      Post.create({title: title, content: '', created_at: Time.now, updated_at: Time.now, pseudonym: Pseudonym.first})
      cdq.save
      self.tableView.insertRowsAtIndexPaths([NSIndexPath.indexPathForRow(Post.count, inSection:0)], withRowAnimation:UITableViewRowAnimationTop)
    end
  end
end