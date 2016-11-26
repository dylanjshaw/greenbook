$(document).ready(function() {
   $(".question-container").on("click", ".delete", function(event) {
      event.preventDefault();
      $.ajax ({
        method: 'DELETE',
        url: $(this).attr('href')
      })

      .done(function(){
        event.target.closest("article").remove();
      })
    });

   $("#update_button").on('click', function(event){
    // event.preventDefault()
    $("#update_button").hide();
    $("#question").show();
   });

   $("#update_answer_button").on('click', function(event){
    // event.preventDefault()
    $("#update_answer_button").hide();
    $("#answer").show();
   })

   $("#vote-arrows").on("click", ".vote-button", function(event){
      event.preventDefault();

      var form = $(this).parent()
      var url  = form.attr('action')
      var data = $(this).serialize()

      $.ajax ({
        method: 'POST',
        url: url,
        data: data
      })
        .done(function(response){
          form.find(".vote-count").text(response);
        })
    })
});


