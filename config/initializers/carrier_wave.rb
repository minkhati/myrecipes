if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      :provider => 'AWS',
      :aws_access_key_id => ENV['S3_ACCESS_KEY'],
      :aws_secret_access_key => ENV['S3_SECRET_KEY']
    }
    
    config.fog_directory = ENV['S3_BUCKET']
  end
end

Access Key ID:
AKIAI6BJW5VXNMM4ZHTA
Secret Access Key:
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

Access Key ID:
AKIAJCQ2VIPO3TQ5KQXQ
Secret Access Key:
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