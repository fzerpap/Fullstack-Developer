#= require bootstrapValidator/bootstrapValidator

jQuery(document).ready ->

  timeOutId = 0
  ajaxFn = ->
    $.ajax
      url: '/paneis/refresh/'
      success: (response) ->
        if response == 'True'
          clearTimeout timeOutId
        else
          timeOutId = setTimeout(ajaxFn, 20000)
          #set the timeout again
          console.log 'call'
        return
    return
  ajaxFn()
  timeOutId = setTimeout(ajaxFn, 20000)