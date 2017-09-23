class UploadImagesJob < ApplicationJob
  queue_as :default

  def perform(*args)
    name, yrmnth, azure, link, approval, comment = args
    Azure::Storage.setup(:storage_account_name => 'gtrainingtest', :storage_access_key => 'g06U3e4kxmbQIusbemxKsvGyb2fR4f1oGMebmWuGguLN/qFa57J/+A1Hh/OW7uEWXYuxYACLbxz+ADw7K6c6Rw==')
    blob = Azure::Storage::Blob::BlobService.new
    binary = ::File.open(path, 'rb'){|file| file.read}
    host = 'https://gtrainingtest.blob.core.windows.net/rubyuploads'
    relative = "#{token}/#{orig}"
    absolute = "#{host}/#{relative}"
    blob.create_block_blob('rubyuploads', relative, binary, {content_type: content_type})
    ap Report.create!(name: name, yrmnth: yrmnth, azure: absolute, link: link, approval: approval, comment: comment)
  end
end

