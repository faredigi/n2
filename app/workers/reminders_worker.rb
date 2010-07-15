class RemindersWorker
  @queue = :reminders

  def self.perform()
=begin
    needs to run nightly
    posts notification to any user we havent reminded recently to add email
    generate a pfeed item for...all users who:
    a) aren't enabled for email email <> '' and receive_email_notifications
    b) haven't turned off email reminders  dont_ask_me_for_email
    c) haven't been asked in two weeks email_last_ask
=end
    # reminder: sign up for email
    recipients = UserProfile.find(:all, :conditions => [ "email != ? AND dont_ask_me_for_email = ? and receive_email_notifications = ? and email_last_ask < date_sub(NOW(), INTERVAL 2 WEEK)", '',0, 1], :order => "user_id DESC", :joins => :user).map(&:user)
    # each user: construct and send chirp with reminder
    # t(reminder.emailsignup_subject) and t(reminder.emailsignup_message)
    # t(emailsignup_action) to link edit_user_path
    # t(emailsignup_stop) link to stop dont_ask_me_for_email_user_path
    # update UserProfile email_last_ask = now()
    #recipients.update_attributes(:email_last_ask, Time.now)
  end

end