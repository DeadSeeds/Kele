require 'httparty'

class Kele
  include HTTParty

  def initialize(username, password)

    @bloc_session = 'https://www.bloc.io/api/v1'
    @auth = { email: username, password: password }

    response = self.class.post("#{@bloc_session}/sessions", body: @auth)
    auth_token = response["auth_token"]

    if auth_token.nil?
      p "Something went wrong, please try again"
    else
      p "Authorization received. Auth_token is: #{auth_token}"
    end
  end

end
