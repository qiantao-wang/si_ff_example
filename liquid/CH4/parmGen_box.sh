#!/bin/sh
#
## Run leap

export AMBERHOME=/home/qwang/amber/amber12_x11_build
export AMBER2=/home/qwang/amber/amber12_master_mm1  




cat > input_leap <<EOF

source leaprc.ff99SBildn
source /home/xuedong/Silicon/example/leaprc.gaff2

loadamberprep   ../prepc/CH4.prepc

loadamberparams CH4.frcmod

mol3 = loadpdb CH4_216.pdb

setbox mol3 vdw 

               
saveamberparm mol3 CH4_216.prmtop        CH4_216.inpcrd 

quit

EOF

# Run tleap
$AMBERHOME/bin/tleap -f ./input_leap

#done
