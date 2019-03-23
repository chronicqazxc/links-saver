module JsonParserHelper
  def open(url)
    begin
      Net::HTTP.get(URI.parse(url))
    rescue SocketError
      'Network connectivity issue'
      # Network is not 100% reliable
    rescue Errno::ECONNREFUSED => e
      'The server is down.'
      # e.message
      # Retry a few times and fail with connection refused error message
    rescue Timeout::Error => e
      'Timeout error occurred.'
      # e.message
      # Retry a few times and fail with timeout error message
    end
  end

  def decode(content)
    begin
      ActiveSupport::JSON.decode(content)
    rescue Exception => e # Never do this!

    end
  end
end
