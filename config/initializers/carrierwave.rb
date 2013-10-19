CarrierWave.configure do |config|
  config.storage    = :aws
  config.aws_bucket = "tablefillr-#{Rails.env}"
  config.aws_acl    = :public_read
  # config.asset_host = 'http://example.com'
  config.aws_authenticated_url_expiration = 60 * 60 * 24 * 365

  config.aws_credentials = {
    access_key_id:     SAFE_ENV['AWS_ACCESS_KEY_ID'],
    secret_access_key: SAFE_ENV['AWS_SECRET_ACCESS_KEY']
  }
end