class Message < ActiveRecord::Base
  include HTTParty
  belongs_to :device
  base_uri 'https://api.getirkit.com'

  def send_data
    Rails.logger.info "#{self.to_json}"
    data = { body:
      {
        clientkey: Station.client_key,
        deviceid: Station.device_id,
        message: self.to_json(only: [:format, :freq, :data])
      }
    }
    self.class.post('/1/messages', data)
  end
end
