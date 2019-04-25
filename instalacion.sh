#!/data/data/com.termux/files/usr/bin/bash

#Instalacion de login

source $HOME/Login/colors

function banner {
clear
echo -e "

$green

     Realizado por
      $yellow          
            ______            _    _             
           |  ____|          | |  (_)            
           | |__   _ __ _   _| | ___ _ __   ___  
           |  __| | '__| | | | |/ / | '_ \ / _ \ 
           | |____| |  | |_| |   <| | | | | (_) |
           |______|_|   \__,_|_|\_\_|_| |_|\___/ 
    $green
             Instalacion de login para termux
                  https://t.me/x3rukin0x
$reset
"
sleep 2
echo
echo 
}
function clave {
  banner
  echo "=================================================="
  echo "Creando una nueva clave de acceso"
  read -p "Escribe la clve de acceso que quieres tener $ " clave_1
  banner
  echo "=================================================="
  read -p "Escribe nuevamente la clave de acceso $ " clave_2
  if [ ["$clave_1"] = ["$clave_2"] ]; then
   rm $PREFIX/libexec/termux/.password/pass
  printf "$clave_1" > $PREFIX/libexec/termux/.password/pass1
  base64 $PREFIX/libexec/termux/.password/pass1 > $PREFIX/libexec/termux/.password/pass
  rm $PREFIX/libexec/termux/.password/pass1
  banner
  echo "Clave nueva guardada con exito"
  sleep 2
  else clear
  echo "***********************"
  echo "** CLAVE NO COINCIDE **"
  echo "** INTENTE DE NUEVO  **"
  echo "***********************"
 sleep 2
  clave
 fi
 pregunta_s
}


function pregunta_s {
    banner
    echo "============================================"
    echo "Iniciando registro de pregunta de seguridad "
    echo
    read -p "Ingresar la pregunta de seguridad $ " pregunta_1
    banner
    echo "============================================"
    read -p "Ingresa de nueva la pregunta de seguridad $ " pregunta_2
    echo 
     if [ ["$pregunta_1"] = ["$pregunta_2"] ]; then
     rm $PREFIX/libexec/termux/.quiz/pregunta_1
     printf "$pregunta_1" > $PREFIX/libexec/termux/.quiz/pregunta_2
     base64 $PREFIX/libexec/termux/.quiz/pregunta_2 > $PREFIX/libexec/termux/.quiz/pregunta_1
     rm $PREFIX/libexec/termux/.quiz/pregunta_2
     echo 
      echo "Completando proceso"
     sleep 2
     respuesta
    else 
     echo "*************************"
     echo "*Error en la pregunta de*"
     echo "********seguridad********"
     echo "*************************"
     sleep 2
     pregunta_s
    fi
}


function respuesta {
     banner
     echo "=============================================="
     echo "Iniciando respuesta a la pregunta de seguridad"
     read -p "Ingresa la respuesta $ " respuesta_1
    banner
     echo "=============================================="
     read -p "Ingresa nuevamente la respuesta $ " respuesta_2
       if [ ["$respuesta_1"] = ["$respuesta_2"] ]; then
       rm $PREXIF/libexec/termux/.quiz/resp_1
       printf $respuesta_1 > $PREFIX/libexec/termux/.quiz/resp
      base64 $PREFIX/libexec/termux/.quiz/resp > $PREFIX/libexec/termux/.quiz/resp_1
      rm $PREFIX/libexec/termux/.quiz/resp
      banner
      echo "Completando proceso"
      echo 
      echo "Se a completado la creacion de preguntade seguridad"
      echo "y respuesta de seguridad"
      echo
      echo "La huella esta sincronizada con la registrada"
      echo "en el desbloqueo de el dispositivo"
      echo "-----------------------------------------------"
      echo " Gracias por tu tiempo disfruta tu login"
      sleep 3
      source $PREFIX/var/log/login.sh
     else
     banner
      echo "***************************"
      echo "** RESPUESTA NO COINCIDE **"
      echo "***************************"
     sleep 2
     respuesta
     fi
}




banner

pkg install termux-api -y
sleep 2
banner

echo " Se completo la instalacion de termux-api "
echo " Copiando archivos" 
echo "0%"
echo "50%"
#Copiando archivos....
cp -r .password $PREFIX/libexec/termux
cp -r .quiz $PREFIX/libexec/termux
cp -r .Huella $PREFIX/libexec/termux
cp -r .banners $PREFIX/libexec
cp opciones $PREFIX/var/log
cp login.sh $PREFIX/var/log
cp colors $PREFIX/libexec
sleep 4
echo "99%"
cp $PREFIX/etc/bash.bashrc $PREFIX/etc/bashito
rm $PREFIX/etc/bash.bashrc
cat $PREFIX/etc/bashito > $PREFIX/etc/bash.bashrc
sed -i "3a clear" $PREFIX/etc/bash.bashrc
sed -i "4a source $PREFIX/var/log/login.sh" $PREFIX/etc/bash.bashrc

echo "100%"
sleep 1
banner
clave
