$ ->
  sub = App.cable.subscriptions.create { channel: "ChatChannel", room: "Best Room" },
    received: (data) ->
      console.log data
      $('#conversation').append """
          <div class='message' style='background-color:#{data.color}'>
            #{data['body']}
          </div>
        """
      $('#conversation').scrollTop($('#conversation').get(0).scrollHeight)

  $('#send').click ->
    sub.send { body: $('#new-message').val() }
    $('#new-message').val('')
    return false

  sendMessage = (e) ->
    if (e.keyCode == 13)
      if (event.shiftKey)
        event.stopPropagation()
      else
        $('#send').click()

  $('#new-message').on 'keyup', sendMessage

