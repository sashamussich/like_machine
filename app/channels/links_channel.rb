# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class LinksChannel < ApplicationCable::Channel
  def subscribed
    stream_from "links_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def update data
  	ActionCable.server.broadcast "links_channel", link: data['link']
  end
end
