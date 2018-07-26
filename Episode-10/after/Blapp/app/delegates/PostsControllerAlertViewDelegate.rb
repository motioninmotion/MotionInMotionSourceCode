module PostsControllerAlertViewDelegate
  def create_new_post(title)
    Post.create({title: title, content: '', created_at: Time.now, updated_at: Time.now, pseudonym: Pseudonym.first})
    cdq.save
    self.tableView.insertRowsAtIndexPaths([NSIndexPath.indexPathForRow(Post.count, inSection:0)], withRowAnimation:UITableViewRowAnimationTop)
  end

  def update_post(post, with_title: new_title)
    Post.all[post].title = new_title
    Post.all[post].updated_at = Time.now
    cdq.save
    self.tableView.reloadRowsAtIndexPaths([NSIndexPath.indexPathForRow(post + 1, inSection:0)], withRowAnimation: UITableViewRowAnimationFade)
  end
end