// $(document).on('click', "#like_botton", function (){
//   console.log(this);
//   var post_id = $(this).data('post-id');
//   console.log( post_id );  
//   var like_id = $(this).data('like-id');
//   console.log( like_id );  
//   var result = $('#like_botton').find('.fas.fa-thumbs-up');

//   if (result.length) {
//     $.ajax ({
//       url:  '/posts/'+ post_id +'/likes/' + like_id,
//       type: 'DELETE',
//       data: {post_id: post_id, id: like_id},
//       dataType: 'JSON',
//       processData: false,
//       contentType: false
//     })

//     .done(function(data){
//       console.log("delete");
//       $('#like-' + post_id).empty();
//       $('#like-' + post_id).append('#like-' + post_id );
//     });
//   } else {
//     $.ajax ({
//       url:  '/posts/'+ post_id +'/likes',
//       type: 'POST',
//       data: {post_id: post_id},
//       dataType: 'JSON',
//       processData: false,
//       contentType: false
//     })

//     .done(function(post){
//       console.log("create");
//       $('#like-' + post_id).empty();
//       $('#like-' + post_id).append('j(render )');    
//     });
//   }
// });