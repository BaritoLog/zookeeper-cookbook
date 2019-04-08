class Yggdrasil
  def initialize(host,api_version,token)
      @host = host
      @api_version = api_version
      @token = token
  end

  def fetch_configs(namespace, overrides)
    uri = URI("http://#{@host}:80/#{@api_version}/configurations/#{namespace}/latest?q=#{overrides}")
    response = nil

    Net::HTTP.start(uri.hostname, uri.port, :use_ssl => uri.scheme == 'https') do |http|
      initial_header = {'token' => @token}
      response = http.request_get(uri, initial_header)
    end

    raise 'Failed to fetch config from yggdrasil!' unless response.code == '200'
    response_body = JSON.parse(response.body)
    raise 'Failed to fetch config from yggdrasil!' unless response_body['success']
    response_body['data']
  end
end

