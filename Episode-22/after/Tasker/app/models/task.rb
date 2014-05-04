class Task < CDQManagedObject
  def update_alert
    UIApplication.sharedApplication.tap do |app|
      app.cancelLocalNotification(self.notification) if self.notification
      self.notification = UILocalNotification.new.tap do |n|
        n.fireDate = self.due_at
        n.timeZone = NSTimeZone.defaultTimeZone
        n.alertBody = "#{self.name} is due"
        n.alertAction = "View Tasks"
        n.soundName = UILocalNotificationDefaultSoundName
        n.applicationIconBadgeNumber = 1
      end
      app.scheduleLocalNotification(self.notification)
    end
  end
end
