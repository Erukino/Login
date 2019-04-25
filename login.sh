#!/data/data/com.termux/files/usr/bin/bash
clear
echo "."
sleep 1
echo
clear

 lectura1=$(head -3 $PREFIX/libexec/termux/.Huella/Huell1 | tail -1)
 lectura2=$(head -3 $PREFIX/libexec/termux/.Huella/Huell2 | tail -1)
 lectura3=$(head -3 $PREFIX/libexec/termux/.Huella/Huell3 | tail -1)
 lectura4=$(head -3 $PREFIX/libexec/termux/.Huella/Huell4 | tail -1)
 lectura5=$(head -3 $PREFIX/libexec/termux/.Huella/Huell5 | tail -1)
 lectura6=$(head -3 $PREFIX/libexec/termux/.Huella/Huell6 | tail -1)


trap ctrl_c 2

function Ctrl_c() {
 echo " Opcion no valida"
sleep 1
}


function quiz {
     clear
     echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
     echo "CLAVE INCORRECTA MUCHOS INTENTOS"
     echo "°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°"
    sleep 2
     source $PREFIX/var/log/opciones
     }

function bienvenida {
       echo "BIENVENIDO"
          sleep 2
         clear
          source $PREFIX/libexec/.banners/Indice
          echo
}
function clave {
      echo
      clave_1=$(base64 -d $PREFIX/libexec/termux/.password/pass) 
      read -p "Ingrese su clave $ " pass1
      if [ "$clave_1" = "$pass1" ]; then
       bienvenida
      else echo "error"
      let  fal=$fal+1
          if [ $fal = 3 ]; then
          quiz
          fi
       inicio
       fi
 }
function lectura_huella {
      echo "Lectura de Huella"
       sleep 3
       termux-fingerprint > $PREFIX/libexec/termux/Huell0
       lectura0=$(head -3 $PREFIX/libexec/termux/Huell0 | tail -1)
       if [ ["$lectura1"] = ["$lectura0"] ]; then
        rm $PREFIX/libexec/termux/Huell0
         bienvenida
       elif [ ["$lectura2"] = ["$lectura0"] ]; then
         rm $PREFIX/libexec/termux/Huell0
          bienvenida
       elif [ ["$lectura3"] = ["$lectura0"] ]; then
         rm $PREFIX/libexec/termux/Huell0
          bienvenida
       elif [ ["$lectura4"] = ["$lectura0"] ]; then
         rm $PREFIX/libexec/termux/Huell0
          bienvenida
       elif [ ["$lectura5"] = ["$lectura0"] ]; then
         rm $PREFIX/libexec/termux/Huell0
          bienvenida
       else echo "ERROR"
         sleep 2
         clear
         rm $PREFIX/libexec/termux/Huell0
         inicio
       fi
}
function inicio {
source $PREFIX/libexec/.banners/present
echo "Bienvenido como desea verificar su login: "
echo "-----------------------------------------"
echo "1) Leyendo huella"
echo "2) Ingresar clave de acceso"
echo "-----------------------------------------"
echo
read -n 1 opcion
echo
echo
       if [ $opcion -eq 1 ]; then
       clear
       echo
       echo "_________________"
       echo "iniciando lectura"
       echo "-----------------"
       lectura_huella
       elif [ $opcion -eq 2 ]; then
       echo 
       clave
       echo
        else
        echo "Opcion invalida"
        let falla= ++
         if [ $falla = 3 ]; then
         quiz
         fi 
        sleep 3
        inicio
        fi
echo 
}

inicio
echo
