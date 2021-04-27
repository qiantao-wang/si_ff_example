#!/bin/sh
#
## Run leap

export AMBERHOME=/home/qwang/amber/amber12_x11_build
export AMBER2=/home/qwang/amber/amber12_master_mm1  




cat > input_leap <<EOF

source leaprc.ff99SBildn
source /home/xuedong/Silicon/example/leaprc.gaff2

loadamberprep   ../prepc/SiH4.prepc
loadamberparams ../../silicon_params_set3.frcmod

mol1 = loadpdb SiH4_216.pdb

setbox mol1 vdw 

               
saveamberparm mol1 SiH4_216.prmtop       SiH4_216.inpcrd 

quit

EOF

# Run tleap
$AMBERHOME/bin/tleap -f ./input_leap

#done
