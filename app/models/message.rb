class Message < ActiveRecord::Base
  belongs_to :user
  belongs_to :finder, class_name: 'User'

  after_create :add_point
  after_create :twilio_lost_item_notification
  after_create :email_lead_to_wedeliver

  def add_point
    @point = Point.new
    @point.user_id = self.find_id
    @point.save
  end

  def twilio_lost_item_notification
    client = Twilio::REST::Client.new(TWILIO_CONFIG['sid'], TWILIO_CONFIG['token'])
    client.account.sms.messages.create(
      from: TWILIO_CONFIG['from'],
      to: User.find_by(id: @message.owner_id).cell_number,
      body: "Someone has found your #{@message.subject}")
  end
  def email_lead_to_wedeliver
    Wedeliver.wedeliver_email(@user).deliver
  end
end
