var dataMySQL = function(today) {
    var dia = today.getDate();
    var mes = today.getMonth() + 1;
    var ano = today.getFullYear();

    if (dia < 10){
        dia = "0" + dia;
    } 
    
    if (mes < 10){
        mes = "0" + mes;
    } 

    var horas = today.getHours();
    var minutos = today.getMinutes(); 
    var segundos = today.getSeconds();

    var data = `${ano}-${mes}-${dia} ${horas}:${minutos}:${segundos}`

    return data;
}

module.exports = dataMySQL;
