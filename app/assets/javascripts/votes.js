$(document).ready(function(){
  $('.vote').on("click",function(){
    var post_id = $(this).last().parent().prev().attr('href').match(/\d/)[0];
    if($('button').last().text().match(/Down/))
      var vote_value = 1;
    else
      var vote_value = -1;
    
    var $self = $(this);

    $.ajax({
      url: '/votes/vote',
      type: 'post',
      data: 'votable_id=' + post_id + '&value=' + vote_value
    }).done(function(response){
      console.log(response);
      $self.last().parent().parent().find('.votecount').text(response.votecount);
    });
  });
});
