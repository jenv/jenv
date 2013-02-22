// This is what changes body from hidden
(function($) {

  $(document.body).fadeIn(1200);

})(jQuery);
$(document).ready(function() {
   
    $('a[href=#top]').click(function(){
        $('html, body').animate({scrollTop:0}, 'slow');
        return false;
    });

});