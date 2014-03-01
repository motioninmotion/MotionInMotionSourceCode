module PostsControllerTableViewDelegate

  def tableView(tableView, didSelectRowAtIndexPath:indexPath)
    tableView.deselectRowAtIndexPath(indexPath, animated:true)

    if indexPath.row == 0
      alert = UIAlertView.alloc.initWithTitle("Post Title", message:"Enter a title for your Blapp post", delegate:self, cancelButtonTitle:"Cancel", otherButtonTitles:"Continue", nil)
      alert.alertViewStyle = UIAlertViewStylePlainTextInput
      alert.show
    else
      self.navigationController.pushViewController(PostDetailController.alloc.initWithPost(Post.all[indexPath.row - 1]), animated:true)
    end
  end

  def tableView(tableView, accessoryButtonTappedForRowWithIndexPath:indexPath)
    alert = UIAlertView.alloc.initWithTitle("Edit Post Title", message:"Enter a title for your Blapp post", delegate:self, cancelButtonTitle:"Cancel", otherButtonTitles:"Continue", nil)
    alert.tag = indexPath.row - 1
    alert.alertViewStyle = UIAlertViewStylePlainTextInput
    alert.textFieldAtIndex(0).text = Post.all[indexPath.row - 1].title
    alert.show
  end

  def tableView(tableView, heightForRowAtIndexPath:indexPath)
    ("Reference Text".sizeWithFont(UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)).height * 1.5) +
    ("Reference Text".sizeWithFont(UIFont.preferredFontForTextStyle(UIFontTextStyleCaption1)).height * 1.5)
  end

end
