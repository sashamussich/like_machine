App.links = App.cable.subscriptions.create "LinksChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    #$('.heart').append "#{data}"

  update: (link) ->
    @perform 'update', link: link


  $(".heart").on "click", (event) -> 
  	App.links.update event.target.value 
  	event.target.value = '' 
  	event.preventDefault()
