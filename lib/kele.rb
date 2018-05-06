require 'httparty'
require 'json'

class Kele
  include HTTParty

  def initialize(username, password)

    @bloc_session = 'https://www.bloc.io/api/v1'
    @auth = { email: username, password: password }

    response = self.class.post("#{@bloc_session}/sessions", body: @auth)
    auth_token = response["auth_token"]
    @auth_token = auth_token

    if auth_token.nil?
      p "Something went wrong, please try again"
    else
      p "Authorization received. Auth_token is: #{auth_token}"
    end
  end

  def get_me
    response = self.class.get("#{@bloc_session}/users/me", headers: { "authorization" => @auth_token })
    bloc_response_hash = JSON.parse("#{response}")
    p "mentor_id = " + "#{bloc_response_hash["current_enrollment"]["mentor_id"]}"
  end

  def get_mentor_availability(id)
    response = self.class.get("#{@bloc_session}/mentors/" + "#{id}" + "/student_availability", headers: { "authorization" => @auth_token })
    mentor_avail = JSON.parse("#{response}")
    # mentor_array = []
    # mentor_avail.each do |day|
    #   mentor_array << day.to_a
    # end
  end

end
