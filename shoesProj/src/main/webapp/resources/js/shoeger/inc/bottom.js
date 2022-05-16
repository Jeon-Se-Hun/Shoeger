function terms(obj) {
   $('.modal-body').scrollTop(0)
   $("#" + obj).modal({
      remote: '/views/shoeger/modal/' + obj + '.jsp'
   });
}