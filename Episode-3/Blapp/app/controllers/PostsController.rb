class PostsController < UITableViewController

  def init
    super

    self.title = "Posts"
    self.tabBarItem = UITabBarItem.alloc.initWithTitle("Posts", image:UIImage.imageNamed('Signpost'), tag:1)

    @postsModel = UIApplication.sharedApplication.delegate.postsModel
    @postsModel.addObserver(self, forKeyPath:'newRecordCount', options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld), context:nil)

    self
  end

  def observeValueForKeyPath(keyPath, ofObject:object, change:change, context:context)
    if keyPath == 'newRecordCount' && (change[NSKeyValueChangeNewKey] - change[NSKeyValueChangeOldKey]) > 0
      self.tableView.reloadData
      self.tabBarController.tabBar.items[0].badgeValue = change[NSKeyValueChangeNewKey].to_s
    end
  end

  def viewDidLoad
    self.tableView.delegate = self
    self.tableView.dataSource = self
  end

  def viewDidAppear(animated)
    self.tabBarController.tabBar.items[0].badgeValue = nil
    @postsModel.resetNewRecordCount
    super
  end

  def tableView(tableView, numberOfRowsInSection:section)
    @postsModel.records.count
  end

  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    @reuseIdentifier ||= "PostsCell"

    cell = tableView.dequeueReusableCellWithIdentifier(@reuseIdentifier) || begin
      UITableViewCell.alloc.initWithStyle(UITableViewCellStyleSubtitle, reuseIdentifier:@reuseIdentifier)
    end

    cell.textLabel.text = @postsModel.records[indexPath.row][:author]
    cell.detailTextLabel.text = @postsModel.records[indexPath.row][:content]

    cell
  end

  def tableView(tableView, didSelectRowAtIndexPath:indexPath)
    postDetailController = PostDetailController.alloc.initWithPostDetails(@postsModel.records[indexPath.row])
    self.navigationController.pushViewController(postDetailController, animated:true)
  end

end
