require 'httparty'
require 'json'
require_relative 'roadmap'
require_relative "messages"

class Kele
  include HTTParty
  # debug_output $stdout
  include Roadmap
  include Messages

  def initialize(username, password)

    @bloc_session = 'https://www.bloc.io/api/v1'
    auth = { email: username, password: password }

    response = self.class.post("#{@bloc_session}/sessions", body: auth)
    auth_token = response["auth_token"]
    @auth_token = auth_token

    if auth_token.nil?
      p "Something went wrong, please try again"
    else
      p "Authorization received. Auth_token is: #{auth_token}"
    end

    get_me

  end

  def get_me
    response = self.class.get("#{@bloc_session}/users/me", headers: { "authorization" => @auth_token })
    bloc_response_hash = JSON.parse("#{response}")
    p "mentor_id = " + "#{bloc_response_hash["current_enrollment"]["mentor_id"]}"
    p "chain_id = " + "#{bloc_response_hash["current_enrollment"]["chain_id"]}"
  end

  def get_mentor_availability(id)
    response = self.class.get("#{@bloc_session}/mentors/" + "#{id}" + "/student_availability", headers: { "authorization" => @auth_token })
    mentor_avail = JSON.parse("#{response}")
  end

end
