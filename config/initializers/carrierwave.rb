require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['aws_access_key_id'],
      aws_secret_access_key: ENV['aws_secret_key'],
      region: 'ap-northeast-1'  # S3バケット作成時に指定したリージョン。左記は東京を指す
    }
    config.fog_directory  = 'recipesspic' # 作成したS3バケット名
    config.fog_attributes = { cache_control: "public, max-age=#{365.days.to_i}" }
  end
  # 日本語ファイル名の設定
  CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/ 
end