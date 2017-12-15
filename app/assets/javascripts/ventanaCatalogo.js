 
 jQuery.fn.doModal = function(){
          var w = $(window).width();
          var h = $(window).height();
          var divW = $(this).width();
          var divH = $(this).height();
          $(this).css({
             'position': 'absolute',
             'left': (w/4)-(divW)+"px",
             'top': (h/2)-(divH)-"px",
             'z-index': '999'
                     });
          $(this).fadeIn(500);
          }
          $(document).ready(function(){
          $("#abrir").click(function(){
          $("#ventana_emergente").doModal();
          });
          $("#cerrar").click(function(){
          $("#ventana_emergente").css('display', 'none');
       });    
    });
        
      