class KeyHookController < UIViewController

  def viewDidLoad
    @button = UIButton.alloc.initWithFrame(CGRectMake(20, 20, self.view.frame.size.width - 40, 50))
    @button.setTitle('Tap here to hook your keys', forState:UIControlStateNormal)
    @button.addTarget(self, action:'hookKeys', forControlEvents:UIControlEventTouchUpInside)
    self.view.addSubview(@button)

    @imageView = UIImageView.alloc.initWithFrame(CGRectMake(20, 100, self.view.frame.size.width - 40, self.view.frame.size.width - 40))
    imageRef = UIImage.imageWithContentsOfFile(App.documents_path + '/key_hook').CGImage
    rotatedImage = UIImage.imageWithCGImage(imageRef, scale:1.0, orientation:UIImageOrientationRight)
    @imageView.image = rotatedImage
    # @imageView.image = UIImage.imageWithContentsOfFile(App.documents_path + '/key_hook')
    self.view.addSubview(@imageView)
  end

  def hookKeys
    if Device.camera.rear?
      Device.camera.rear.picture(media_types: [:image]) do |result|
        unless result[:error]
          @imageView.image = result[:original_image]
          #data = UIImageJPEGRepresentation(result[:original_image], 0.5) # 50% quality
          data = UIImagePNGRepresentation(result[:original_image])
          data.writeToFile(App.documents_path + '/key_hook', atomically:true)

          UIImageWriteToSavedPhotosAlbum(result[:original_image], nil, nil, nil)
        end
      end
    else
      App.alert('You need a camera...')
    end
  end

end