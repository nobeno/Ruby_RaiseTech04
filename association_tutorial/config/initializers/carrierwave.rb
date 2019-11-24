CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['KEY_ID'],
    aws_secret_access_key: ENV['ACCESS_KEY'],
    region: ENV['REGION']
    #host:                  's3.example.com',             # optional, defaults to nil
    #endpoint:              'https://s3.example.com:8080' # optional, defaults to nil
  }
  config.fog_directory  = 'raise-for-rails-image' # required
  config.fog_public     = false                   # optional, defaults to true
  config.fog_attributes = { cache_control: "public, max-age=#{365.days.to_i}" } # optional, defaults to {}
end
