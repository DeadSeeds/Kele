module Messages
  def get_messages(page = nil)
    if page.nil?
      response = self.class.get("#{@bloc_session}/message_threads", headers: { "authorization" => @auth_token })
      message_page = JSON.parse("#{response}")
    else
      page_number = { page: page }
      response = self.class.get("#{@bloc_session}/message_threads", body: page_number, headers: { "authorization" => @auth_token })
      message_page = JSON.parse("#{response}")
    end
  end

  def create_message(sender:, recipient_id:, stripped_text:, token: nil, subject: nil)
    message = { "sender" => "#{sender}", "recipient_id" => recipient_id, "token" => "#{token}", "subject" => "#{subject}", "stripped-text" => "#{stripped_text}" }
    binding.pry
    response = self.class.post("#{@bloc_session}/messages", body: message, headers: { "authorization" => @auth_token})
  end
end
