module Roadmap

  def get_roadmap(chain_id)
    response = self.class.get("#{@bloc_session}/roadmaps/"+ "#{chain_id}", headers: { "authorization" => @auth_token })
    JSON.parse("#{response}")
  end

  def get_checkpoint(checkpoint_id)
    response = self.class.get("#{@bloc_session}/checkpoints/" + "#{checkpoint_id}", headers: { "authorization" => @auth_token })
    JSON.parse("#{response}")
  end

  def get_remaining_checkpoints(chain_id)
    response = self.class.get("#{@bloc_session}/enrollment_chains/"+ "#{chain_id}" + "/checkpoints_remaining_in_section", headers: { "authorization" => @auth_token })
    JSON.parse("#{response}")
  end

end
