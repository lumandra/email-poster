report =
  init: ->
    @saveReport()

  saveReport: ->
    $('.subscribe').on "click", ->
      report_id = $(this).data('report-id')
      subscribe = $(this).is(":checked")
      $.ajax(
        type: "post"
        url: "/user_reports/#{report_id}/subscribe"
        data:
          subscribe: subscribe
        dataType: "json"
      ).done (data) ->
        $(".alert").remove()
        if data.errors
          $(".reports").prepend "<div class='alert alert-danger'>Not stored</div>"
        else
          $(".reports").prepend "<div class='alert alert-success'>Subscribed</div>"
          setTimeout "$('.alert').hide();", 3000 


$ ->
  report.init()