module Roadmap

  def get_roadmap(chain_id)
    response = self.class.get("#{@bloc_session}/roadmaps/"+ "#{chain_id}", headers: { "authorization" => @auth_token })
    JSON.parse("#{response}")
  end

  def get_checkpoint(checkpoint_id)
    response = self.class.get("#{@bloc_session}/checkpoints/" + "#{checkpoint_id}", headers: { "authorization" => @auth_token })
    JSON.parse("#{response}")
  end

end
