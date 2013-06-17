$(document).ready(function(){
  $('.results').click(function(e){
    e.preventDefault();
    $.ajax({
      method: 'get',
      url: '/surveys/'+$('.results').attr('id')+'/quick_report'
    }).success(function(response){
      $('.survey-quickview').append(response);
      $.ajax({
        method: 'get',
        url: '/surveys/'+$('.results').attr('id')+'/report'
      }).success(function(response){
        var data = fixResponse(response);
        var ctx = $("#myChart").get(0).getContext("2d");
        var myNewChart = new Chart(ctx);
        new Chart(ctx).Pie(data);
      });
    });
  });

  function fixResponse(response) {
    var data = jQuery.parseJSON(response);
    for(i=0; i < data.length; i++)
    {
      data[i].color = '#'+Math.floor(Math.random()*16777215).toString(16);
    }
    // console.log(response);
    return data;
  }
});

