class PostsController < UITableViewController

  def init
    super

    self.title = "Posts"
    self.tabBarItem = UITabBarItem.alloc.initWithTitle("Posts", image:UIImage.imageNamed('Signpost'), tag:1)

    @postsModel = UIApplication.sharedApplication.delegate.postsModel

    self
  end

  def viewDidLoad
    self.tableView.delegate = self
    self.tableView.dataSource = self
  end

  def viewDidAppear(animated)
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
