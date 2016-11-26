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

   $(".question-container").on("submit", "#vote-arrows", function(event){
      event.preventDefault();
      var form = $(this)
      var url  = $(this).attr('action')
      var data = $(this).serialize()

      $.ajax ({
        method: 'POST',
        url: url,
        data: data
      })
        .done(function(response){
          var voteCountNode = form.parent().find(".vote-count")
          var voteCount = parseInt(voteCountNode.text());
          var voteValue = parseInt(response)
          voteCountNode.text(voteCount + voteValue);
          form.find("button").addClass("colored");
        })
    })
});


