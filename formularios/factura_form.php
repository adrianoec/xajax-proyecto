<?php

?>

<form name="form" id="form" action="" method="get" accept-charset="utf-8">
	<p align="center">
		<table border="0">
			<tr align="center">
				<td colspan="2">
				<fieldset title="Cliente">
					<legend align= "center">
						Datos del Cliente
					</legend>
					<table border="0">
						<tr>
							<td>Tipo Documento:</td>
							<td>*</td>
							<td>
							<select >
								<option value="">Seleccione</option>
							</select></td>
							<td>Documento:</td>
							<td>*</td>
							<td>
							<input type="text" name="txtDocumento" id="txtDocumento" />
							<input type="button" name="btnBuscar" id="btnBuscar" value="&rarr;" onclick=""/>
							</td>
						</tr>
						<tr>
							<td>Cliente:</td>
							<td>*</td>
							<td>
							<input type="text" name="txtCliente" id="txtCliente"  size="32" />
							</td>
							<td>Telefono:</td>
							<td>*</td>
							<td>
							<input type="text" name="txtTelefono" id="txtTelefono" />
							</td>
						</tr>
						<tr>

							<td>Email:</td>
							<td>*</td>
							<td>
							<input type="text" name="txtEmail" id="txtEmail" size="32" />
							</td>
							<td>Direccion:</td>
							<td>*</td>
							<td colspan="4">							<textarea name="txtDireccion" id="txtDireccion" cols="30" rows="2"> </textarea></td>
						</tr>
					</table>
				</fieldset></td>
			</tr>
			<tr align="center">
				<td colspan="2">
				<fieldset title="Detalle">
					<legend align= "center">
						Detalle de Productos
					</legend>
					<label>Producto :
						<input type="text" name="txtProducto" id="txtProducto" />
						<input type="button" name="btnBuscarPro" id="btnBuscarPro" value="&rarr;" onclick=""/>
					</label>
					<table class="" >
						<input type="hidden" name="txtIndice" id="txtIndice" value="1" />
						<tr id="tr_0" class="">
							<th id="td_0_1" width="100px" class="borde_head"> Principal </th>
							<th id="td_0_2" width="100px" class="borde_head"> Cod Auxiliar </th>
							<th id="td_0_3" width="80px" class="borde_head"> Cantidad </th>
							<th id="td_0_4" width="200px" class="borde_head"> Descripcion </th>
							<th id="td_0_5" width="200px" class="borde_head"> Descripcion Adicional </th>
							<th id="td_0_6" width="100px" class="borde_head"> P. Unitario </th>
							<th id="td_0_7" width="100px" class="borde_head"> Descuento </th>
							<th id="td_0_8" width="100px" class="borde_head"> Precio Total </th>
							<th id="td_0_9" width="30px" onclick="xajax_addrow(document.getElementById('txtIndice').value)">
								<img src="imagenes/add.png" />
							</th>
							<th id="td_0_10"  width="30px" >
								<img src="imagenes/cross.png" />
							</th>
						</tr>
						</table>
	
					<div id="dvDet2"> </div>
				</fieldset></td>
			</tr>
			<tr align="right">

				<td colspan="2">
				<fieldset title="Valor Factura" align="right">
					<legend align= "center">
						Valor de Factura
					</legend>
					<table border="0">
						<tr>
							<td>Subtotal 12%:</td>
							<td>
							<input type="text" name="txtSubtotal12" value="" id="txtSubtotal12" />
							</td>
						</tr>
						<tr>
							<td>Subtotal 0%:</td>
							<td>
							<input type="text" name="txtSubtotal0" value="" id="txtSubtotal0" />
							</td>
						</tr>
						<tr>
							<td>Subtotal no sujeto de IVA:</td>
							<td>
							<input type="text" name="txtSubtotalnoiva" value="" id="txtSubtotalnoiva" />
							</td>
						</tr>
						<tr>
							<td>Subtotal sin impuestos:</td>
							<td>
							<input type="text" name="txtSubtotalsinimp" value="" id="txtSubtotalsinimp" />
							</td>
						</tr>
						<tr>
							<td>Descuento:</td>
							<td>
							<input type="text" name="txtDescuento" value="" id="txtDescuento" />
							</td>
						</tr>
						<tr>
							<td>ICE:</td>
							<td>
							<input type="text" name="txtIce" value="" id="txtIce" />
							</td>
						</tr>
						<tr>
							<td>IVA 12%:</td>
							<td>
							<input type="text" name="txtIva" value="" id="txtIva" />
							</td>
						</tr>
						<tr>
							<td>Propina:</td>
							<td>
							<input type="text" name="txtPropina" value="" id="txtPropina" />
							</td>
						</tr>
						<tr>
							<td>Valor Total:</td>
							<td>
							<input type="text" name="txtValorTotal" value="" id="txtValorTotal" />
							</td>
						</tr>
					</table>
				</fieldset></td>

			</tr>
			<tr>
				<td colspan="2">
				<fieldset title="Valor Factura" align="right">
					<legend align= "center"></legend>
					<table width="100%">
						<tr align="center">
							<td>
							<input type="button" name="btnGuardar" id="btnGuardar" value="Guardar" />
							</td>

							<td>
							<input type="button" name="btnGuardar" id="btnGuardar" value="Guardar & Firmar" />
							</td>

							<td>
							<input type="button" name="btnGuardar" id="btnGuardar" value="Cancelar" />
							</td>
						</tr>
					</table>
				</fieldset></td>
			</tr>
		</table>
	</p>
</form>
<div id="dvrespuesta"></div>
