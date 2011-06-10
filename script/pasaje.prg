* [namefile] debe ser reemplazdo por el nombre del archivo que quiere convertir.
* en el caso de movimientos movco.dbf utilizar esto asi
set delete on
set date to dmy
use [namefile] in 0 shared 

* en el caso de plan de cuentas maeco.dbf ordenar por campo cuenta
* select * from maeco order by cuenta 
* replace nombre with strtran(nombre,' "'," '") all

replace desmov with strtran(desmov,' "'," '") all
copy to [namefile].csv type csv
close data