class Message < ActiveRecord::Base
  include HTTParty
  belongs_to :device
  base_uri 'https://api.getirkit.com'

  def send_data
    data = { body:
      {
        clientkey: Station.client_key,
        deviceid: Station.device_id,
        message: self.to_api
      }
    }
    self.class.post('/1/messages', data)
  end

  def to_api
    Rails.logger.info "#{self.as_json}"
    message = self.as_json(only: [:format, :freq, :data])
    message['data'] = message['data'].split(',').map(&:to_i)
    message.to_json
  end
end
