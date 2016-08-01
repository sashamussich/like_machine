App.links = App.cable.subscriptions.create "LinksChannel",
  connected: ->
    # Called when the subscription is ready for use on the server
    $('.ws_connection_status').html '<p class="label label-success">Connected to ACable</p>'

  disconnected: ->
    # Called when the subscription has been terminated by the server
    $('.ws_connection_status').html '<p class="label label-warning">Disconnected from ACable</p>'

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    link_id = data['link_id']
    #alert data['current_user']
    $('#' + link_id).html data['link_partial']
    

  vote: (link) ->
    @perform 'vote', link


  $(document).on 'click', '.like_link, .dislike_link', -> 
    link_id = $(this).data("link-id")
    current_user_id = $(this).data("current-user-id")
    if $(this).hasClass("like_link") == true
        vote = "like"
    else
        vote = "dislike"
    linkJSON = {"link_id":link_id, "current_user_id":current_user_id, "vote":vote}
    #console.log(linkJSON)
    App.links.vote(linkJSON)
