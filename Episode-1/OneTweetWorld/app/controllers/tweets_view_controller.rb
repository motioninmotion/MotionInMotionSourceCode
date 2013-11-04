class TweetsViewController < UIViewController

  def viewDidLoad
    view.backgroundColor = UIColor.whiteColor

    Motion::Layout.new do |layout|
      layout.view view
      layout.subviews "userImage" => userImage, "userTweet" => userTweet, "toolbar" => toolbar, "userName" => userName, "userBio" => userBio
      layout.vertical "|-40-[userImage(==70)]-(>=20)-|"
      layout.vertical "|-40-[userName(==20)]-10-[userBio(==40)]-(>=20)-|"
      layout.vertical "|-120-[userTweet]-10-[toolbar]-|"
      layout.horizontal "|-20-[userImage(==70)]-(>=20)-|"
      layout.horizontal "|-100-[userName]-20-|"
      layout.horizontal "|-100-[userBio]-20-|"
      layout.horizontal "|-20-[userTweet]-20-|"
      layout.horizontal "|[toolbar]|"
    end
  end

  def userTweet
    viewNamed('User Tweet', ofClass: UITextView) do |view|
      view.editable = false
    end
  end

  def toolbar
    viewNamed('Toolbar', ofClass: UIToolbar) do |view|
      view.items = [nextTweetButton]
    end
  end

  def nextTweetButton
    viewNamed('Next Tweet', ofClass: UIBarButtonItem) do |view|
      view.title = 'Next Tweet'
    end
  end

  def userImage
    viewNamed('User Image', ofClass: UIImageView)
  end

  def userName
    viewNamed('User Name', ofClass: UILabel)
  end

  def userBio
    viewNamed('User Bio', ofClass: UILabel)
  end

  def viewNamed(view_name, ofClass: class_reference)
    var_name = view_name[0].downcase + view_name[1, view_name.length - 1].gsub(/\s/, '')

    instance_variable_get("@#{var_name}") or instance_variable_set("@#{var_name}", class_reference.new).tap do |view|
      view.accessibilityLabel = view_name
      yield view if block_given?
    end
  end

end