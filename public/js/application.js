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
    })
});
