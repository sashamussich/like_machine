class LinksUpdatesBroadcastJob < ApplicationJob
  queue_as :default

  def perform link
    ActionCable.server.broadcast "links_channel", { link: render_link_voting_buttons(link), link_id: link.id}
  end

  private

  def render_link_voting_buttons link
  	LinksController.render :_link, locals: { link: link }
  end
end
