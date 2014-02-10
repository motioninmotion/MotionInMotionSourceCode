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

    self
  end
end
