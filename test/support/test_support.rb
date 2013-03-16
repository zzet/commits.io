module TestSupport

  def set_http_referer(url = '/')
    @request.env['HTTP_REFERER'] = url
  end

  def set_raw_post_data(data)
    @request.env['RAW_POST_DATA'] = data
  end

  def fixture_file_upload(path, mime_type = nil, binary = false)
    fixture_path = Rails.root.join('test', 'fixtures')
    Rack::Test::UploadedFile.new("#{fixture_path}/#{path}", mime_type, binary)
  end

end
