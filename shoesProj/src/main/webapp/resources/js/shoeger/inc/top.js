$(function() {

   $('#search').click(function() {
      $('#whenClick').css('height', '400px');
   });
   
   $('#search').keyup(function(e) {
      $('.ccc').hide();
      var search = $(this).val();

      $('#keyTitle').text(search);
      if (search.length == 0 || (search.length == 0 && (e.keyCode == 46 || e.keyCode == 8))) {
         $('.zzz').remove();
         $('.ccc').show();
         return;
      }

      $.ajax({
         type: 'POST',
         data: JSON.stringify({
            search: search,
         }),
         url: "/searchProd.do",
         contentType: "application/json",
         success: function(data) {
            $('.zzz').remove();
            for(var i in data.search) {
               var div1 = "<div class='zzz'>"
               div1 += "<a href='/shoeger/shop/thatList?page=1&model=" + data.search[i].model + "' class='top_aTag'>"
               div1 += "<img class='sImg' src='/resources/up/Thumbnail/" + data.search[i].img1 + "'/>"
               div1 += "<div>"
               div1 += "<p class='pTag'>" + data.search[i].kname + "<br/>"
               div1 += data.search[i].ename + "</p>"
               div1 += "</div></a></div>"
               
               $('.inner').append(div1);
            }
         },
         error: function(error) {
            alert("error : " + error);
         }
      })

   });

});

$($(this)).click(function(e) {
   if (e.screenY > 521) {
      $('#whenClick').css('height', '0px');
      $('.zzz').remove();
      $('#search').val('');
      $('#keyTitle').text('');
   }
});
