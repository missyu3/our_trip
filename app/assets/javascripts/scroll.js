$(window).on('scroll', function() {
  scrollHeight = $('.comment_window').height();
  scrollPosition = $('.comment_window').height() + $('.comment_window').scrollTop();
  if ( (scrollHeight - scrollPosition) / scrollHeight <= 0.05) {
        $('.jscroll').jscroll({
          contentSelector: '.comment_window',
          nextSelector: 'span.next:last a'
        });
  }
});