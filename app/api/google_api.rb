class GoogleApi
  include HTTParty
  base_uri 'https://www.googleapis.com'

  def verify_id_token(id_token)
    self.class.get('/oauth2/v3/tokeninfo', query: {id_token: id_token})
  end
end
