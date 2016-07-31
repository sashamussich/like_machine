class LinksUpdatesBroadcastJob < ApplicationJob

  queue_as :default

  def perform link, current_user
    ActionCable.server.broadcast "links_channel", {  link_id: link.id, current_user: current_user.name } 
  end

  private

  def render_link link, current_user
  	ApplicationController.renderer.render(partial: 'links/link', locals: { link: link, current_user: current_user })
  end

end
