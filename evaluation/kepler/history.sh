  1  git fetch upstream
    2  git checkout -b eval_p2_1_g2 upstream/eval_p2_1_g2
    3  git push -u origin eval_p2_1_g2
    4  history
    5  ls kepler/
    6  pwd
    7  ls
    8  cd kepler
    9  cd evaluation
   10  ls
   11  cd kepler
   12  ls
   13  mv docs registros
   14  mkdir plantillas
   15  git add .
   16  git commit -m "Fix problema 1: estructura de directorios corregida"
   17  history
   mv sensores.log registros/
   19  mv ajustes.old ajustes.conf
   20  git add .
   21  git commit -m "Fix problema 2: archivos movidos y renombrados"
   22  history
   history
   23  cd registros
   24  chmod 640 sensores.log
   25  ls -l
   26  git add .
   27  git commit -m "Fix problema 3: permisos numericos 600 en sensores.log"
   28  history
   29  cd ..
   30  ls
   31  chmod u+x runner.sh
   32  chmod o-w ajustes.conf
   33  ls -l
   34  git add .
   35  git commit -m "Fix problema 4: permisos simbolicos corregidos"
   36  history
   