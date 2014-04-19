/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function calcularDetalle(i) {
//    $objResponse->assign("cmbIce_", "value", "$codigoIce");
//    if ($tarifa12 > 0) {
//        $objResponse->assign("chkIva_$indice", "checked", "checked");
//    }

    var pu = parseFloat(document.getElementById("txtPU_" + i).value);
    var ca = parseFloat(document.getElementById("txtC_" + i).value);
    var des = parseFloat(document.getElementById("txtDsct_" + i).value);

    var val_iva = parseFloat(document.getElementById("txtIVA_" + i).value);
    var por_iva = parseFloat(document.getElementById("txtPIVA_" + i).value);
    var cod_iva = parseFloat(document.getElementById("txtCIVA_" + i).value);

    var val_ice = parseFloat(document.getElementById("txtICE_" + i).value);
    var por_ice = parseFloat(document.getElementById("txtPICE_" + i).value);
    var cod_ice = parseFloat(document.getElementById("txtCICE_" + i).value);


    var cal = 0.00;

    if (isNaN(des)) {
        des = 0.00;
    }
    if (isNaN(ca)) {
        ca = 0.00;
    }
    if (isNaN(pu)) {
        pu = 0.00;
    }

    if (isNaN(val_iva)) {
        val_iva = 0.00;
    }
    if (isNaN(por_iva)) {
        por_iva = 0;
    }
    if (isNaN(cod_iva)) {
        cod_iva = 0;
    }
    if (isNaN(val_ice)) {
        val_ice = 0.00;
    }
    if (isNaN(por_ice)) {
        por_ice = 0;
    }
    if (isNaN(cod_ice)) {
        cod_ice = 0;
    }


    cal = (pu * ca) - des;
    if (cal < 0) {
        cal = 0.00;
    }
    document.getElementById("txtPT_" + i).value = cal.toFixed(2);
    document.getElementById("txtC_" + i).value = ca.toFixed(4);
    document.getElementById("txtPU_" + i).value = pu.toFixed(4);
    document.getElementById("txtDsct_" + i).value = des.toFixed(2);

    calcularTotal();


}

function calcularTotal() {
    var items = parseInt(document.getElementById("txtIndice").value);
    // calculo de los valores totales
    var subtotal12 = 0;
    var subtotal0 = 0;
    var subtotal = 0;
    var descuento = 0;
    var ice = 0;
    var iva = 0;
    var propina = 0;
    var total = 0;

    var puni = 0;
    var cant = 0;
    var desc = 0;
    var ptot = 0;
    var val_iva = 0;
    var por_iva = 0;
    var cod_iva = 0;
    var val_ice = 0;
    var por_ice = 0;
    var cod_ice = 0;

    for (var i = 1; i <= items; i++) {
        puni = parseFloat(document.getElementById("txtPU_" + i).value);
        cant = parseFloat(document.getElementById("txtC_" + i).value);
        desc = parseFloat(document.getElementById("txtDsct_" + i).value);

        ptot = parseFloat(document.getElementById("txtPT_" + i).value);

        val_iva = parseFloat(document.getElementById("txtIVA_" + i).value);
        por_iva = parseFloat(document.getElementById("txtPIVA_" + i).value);
        cod_iva = parseFloat(document.getElementById("txtCIVA_" + i).value);

        val_ice = parseFloat(document.getElementById("txtICE_" + i).value);
        por_ice = parseFloat(document.getElementById("txtPICE_" + i).value);
        cod_ice = parseFloat(document.getElementById("txtCICE_" + i).value);

        if (isNaN(desc)) {
            desc = 0.00;
        }
        if (isNaN(cant)) {
            cant = 0.00;
        }
        if (isNaN(puni)) {
            puni = 0.00;
        }
        if (isNaN(val_iva)) {
            val_iva = 0.00;
        }
        if (isNaN(por_iva)) {
            por_iva = 0;
        }
        if (isNaN(cod_iva)) {
            cod_iva = 0;
        }
        if (isNaN(val_ice)) {
            val_ice = 0.00;
        }
        if (isNaN(por_ice)) {
            por_ice = 0;
        }
        if (isNaN(cod_ice)) {
            cod_ice = 0;
        }

        subtotal = subtotal + ptot;
        if (por_iva > 0) {
            subtotal12 = subtotal12 + ptot;
            iva = iva + (ptot * por_iva / 10.00);
        } else {
            subtotal0 = subtotal0 + ptot;
        }

        if (por_ice > 0) {
            ice = ice + (ptot * por_ice / 10.00);
        }

        descuento = descuento + desc;



    }
    total = total + subtotal + iva + ice + propina;

    document.getElementById("txtSubtotal12").value = (subtotal12).toFixed(2);
    document.getElementById("txtIva").value = (iva).toFixed(2);
    document.getElementById("txtSubtotal0").value = (subtotal0).toFixed(2);
    document.getElementById("txtIce").value = (ice).toFixed(2);
    document.getElementById("txtSubtotalsinimp").value = (subtotal).toFixed(2);
    document.getElementById("txtDescuento").value = (descuento).toFixed(2);
    document.getElementById("txtPropina").value = (((subtotal) * 10) / 100.00).toFixed(2);
    document.getElementById("txtValorTotal").value = (total).toFixed(2);

}

function calcularPrecioTotal(i) {

    var pu = document.getElementById("txtPU_" + i);
    var ca = document.getElementById("txtC_" + i);
    var des = document.getElementById("txtDsct_" + i);

    document.getElementById("txtPT_" + i).value = (pu.value * ca.value) - des.value;
    //alert(i);
}

function soloNumeros(campo) {
    var RegExPattern = /^([0-9]*)([\.]{0,1})([0-9]{0,4})$/;
    var txt = campo.value;
    if ((campo.value.match(RegExPattern)) && (campo.value != '')) {
        campo.value = txt;
    } else {
        var dato = parseFloat(txt.substring(0, txt.length - 1));
        if (isNaN(dato)) {
            dato = 0.00;
        }
        campo.value = dato;
    }
}
