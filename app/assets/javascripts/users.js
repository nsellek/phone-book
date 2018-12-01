$(document).ready(function(){
  if($('#search').length > 0){
    console.log('#search');
    main();
  }
});

function main(){
  handleSearch();
}

function handleSearch(){
  $('#search_btn').click(function(e){
    e.preventDefault();
    if(e.stopPropagation)
      e.stopPropagation();

    $.ajax({
      url: '/users.js',
      data: {
        first_name: $('#first_name').val(),
        last_name: $('#last_name').val(),
        email: $('#email').val(),
        state_id: $('#state_id').val()
      }
    });
  });
}
