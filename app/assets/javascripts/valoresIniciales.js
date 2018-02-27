$(document).ready(function(){
		                $("#boton").click(function () {	 
			            var valor= $('input:radio[name=tipoactividad]:checked').val();
			            $("#solicitud").submit();
			              });
		                return valor;
		                });