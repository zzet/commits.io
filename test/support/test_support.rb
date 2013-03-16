module TestSupport

  def set_http_referer(url = '/')
    @request.env['HTTP_REFERER'] = url
  end

  def set_raw_post_data(data)
    @request.env['RAW_POST_DATA'] = data
  end

end
