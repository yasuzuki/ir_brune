require 'yaml'

class Station
  def self.settings
    @settings ||= YAML.load_file("#{Rails.root}/config/ir_kit.yml")
  end

  def self.client_key
    if Rails.env == "production"
      ENV['IRKIT_CLIENT_KEY']
    else
      settings['client_key']
    end
  end

  def self.device_id
    if Rails.env == "production"
      ENV['IRKIT_DEVICE_ID']
    else
      settings['device_id']
    end
  end
end
