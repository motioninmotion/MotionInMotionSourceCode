class PostView < UIView
  attr_accessor :contentView, :authorAreaLabel, :authorBioView

  def initWithFrame(frame, andPost:post)
    self.initWithFrame(frame)
    @post = post

    self.stylesheet = Teacup::Stylesheet[:main]
    
    layout self do

      self.contentView = subview UITextView, :content_view, {
        text: @post.content
      }

      self.authorAreaLabel = subview UILabel, :author_label, {
        text: "About #{@post.pseudonym.name}"
      }

      self.authorBioView = subview UITextView, :author_bio, {
        text: @post.pseudonym.bio
      }

    end

    apply_constraints

    NSNotificationCenter.defaultCenter.addObserver(self,
                                          selector:'font_changed:',
                                              name:UIContentSizeCategoryDidChangeNotification,
                                            object:nil)

    self
  end

  def font_changed(notfication)
    self.contentView.font = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
    self.authorAreaLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)
    self.authorBioView.font = UIFont.preferredFontForTextStyle(UIFontTextStyleCaption1)
  end
end
