<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html lang="esS" >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>
<link rel="stylesheet" href="css/bootstrap.css"/>
<link rel="stylesheet" href="css/bootstrapValidator.css"/>

<title>Registra Proveedor</title>
</head>
<body>

<div class="container">
<h1>Registra Proveedor</h1>

	<c:if test="${sessionScope.MENSAJE != null}">
		<div class="alert alert-success fade in" id="success-alert">
		 <a href="#" class="close" data-dismiss="alert">&times;</a>
		 <strong>${sessionScope.MENSAJE}</strong>
		</div>
	</c:if>
	<c:remove var="MENSAJE" />

	<form action="registraProveedor" id="id_form" method="post"> 
			<input type="hidden" name="metodo" value="registra">	
			<div class="form-group">
				<label class="control-label" for="id_razon">RazÛn Social</label>
				<input class="form-control" type="text" id="id_razon" name="razSocial" placeholder="Ingrese la razÛn social">
			</div>
			<div class="form-group">
				<label class="control-label" for="id_direccion">DirecciÛn</label>
				<input class="form-control" type="text" id="id_direccion" name="dirProveedor" placeholder="Ingrese la direcciÛn">
			</div>
			<div class="form-group">
				<label class="control-label" for="id_ruc">RUC</label>
				<input class="form-control" id="id_ruc" name="rucProveedor" placeholder="Ingrese el n˙mero de ruc" type="text"/>
			</div>
			<div class="form-group">
				<label class="control-label" for="id_fecha">Fecha</label>
				<input class="form-control" id="id_fecha" name="fecProveedor" placeholder="Ingrese la fecha" type="text"/>
			</div>
			<div class="form-group">
				<label class="control-label" for="id_categoria">CategorÌa</label>
				<select id="id_categoria" name="categoria.idCategoria" class='form-control'>
					<option value=" ">[Seleccione]</option>    
				</select>
		    </div>
			<div class="form-group">
				<button type="submit" class="btn btn-primary" >Crea Proveedor</button>
			</div>
	</form>
</div>

<script type="text/javascript">
console.log("inicio");
$.getJSON("cargaCategoria", {}, function(data){
	$.each(data, function(index,item){
		$("#id_categoria").append("<option value="+item.idCategoria +">"+ item.nomCategoria +"</option>");
	});
});
</script>

<script type="text/javascript">
$("#success-alert").fadeTo(1000, 500).slideUp(500, function(){
    $("#success-alert").slideUp(500);
});
</script>

<script type="text/javascript">

$('#id_form').bootstrapValidator({
    message: 'This value is not valid',
    feedbackIcons: {
        valid: 'glyphicon glyphicon-ok',
        invalid: 'glyphicon glyphicon-remove',
        validating: 'glyphicon glyphicon-refresh'
            
    },
    fields: {
    	id_razon: {
    		selector : '#id_razon',
            validators: {
            	notEmpty: {
                    message: 'La razon social es un campo obligatorio'
                },
            	regexp: {
                    regexp: /^[a-zA-Z·ÈÌÛ˙¡…Õ”⁄ÒN	]{3,40}$/,
                    message: 'La razon social debe tener de 3 a 40 letras'
                }
            }
        },
        id_direccion: {
    		selector : '#id_direccion',
            validators: {
                notEmpty: {
                    message: 'La direccion es un campo obligatorio'
                },
               
                stringLength :{
                	message:'La direccion es de 3 a 40 caracteres',
                	min : 3,
                	max : 40
                }
            }
        },
        id_ruc: {
    		selector : '#id_ruc',
            validators: {
            	notEmpty: {
                    message: 'El RUC es un campo obligatorio'
                },
        	regexp: {
	            regexp: /^[0-9]{11}$/,
	            message: 'El RUC debe ser de 11 digitos'
        		}
            }
        },
        id_fecha: {
        	selector : '#id_fecha',
            validators: {
            	notEmpty: {
                    message: 'La fecha es un campo obligatorio'
                },
        	date: {
                format: 'YYYY-MM-DD',
                message: 'El formato de la fecha es YYYY-MM-dd'
            }
        }
      },
      categoria: {
  		selector : '#id_categoria',
          validators: {
          	notEmpty: {
                  message: 'La categoria es un campo obligatorio'
              },
          }
      },
    } 
    
});
</script>

<script type="text/javascript">
$("#success-alert").fadeTo(2000, 500).slideUp(500, function(){
    $("#success-alert").slideUp(500);
});
</script>

</body>
</html>




