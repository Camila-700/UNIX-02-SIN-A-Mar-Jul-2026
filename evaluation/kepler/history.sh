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
   37  ls -l
   38  chmod u+s runner.sh
   39  ls -l
   40  git add.
   41  git add .
   42  git commit -m "Fix problema 5: SUID activado en runner.sh"
   43  history
    git push
   45  chmod +t /tmp/kepler_zone
   46  cd ..
   47  mkdir /tmp/kepler_zone
   48  cd tmp
   49  ls /tmp
   50  mkdir -p /tmp/kepler_zone
   51  ls -ld /tmp/kepler_zone
   52  chmod +t /tmp/kepler_zone
   53  ls -ld /tmp/kepler_zone
   54  git add .
   55  git commit -m "Fix problema 6: sticky bit en /tmp/kepler_zone"
   56  git push
   57  history
   history
   58  gpg --full-generate-key
   59  cd registros
   60  cd kepler
   61  cd registros
   62  gpg --output kepler/registros/sensores.log.gpg     --encrypt     --recipient vega@kepler.lab     kepler/registros/sensores.log
   63  git add .
   64  git commit -m "Fix problema 7: llave GPG generada y sensores.log cifrado"
   65  git push
   66  history