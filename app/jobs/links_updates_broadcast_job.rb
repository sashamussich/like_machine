class LinksUpdatesBroadcastJob < ApplicationJob
  queue_as :default

  def perform link
    ActionCable.server.broadcast "links_channel", { link_partial: render_link(link), link_id: link.id } 
  end

  private

  def render_link link
  	ApplicationController.renderer.render(partial: 'links/link', locals: { link: link, current_user: User.first })
  end
end
