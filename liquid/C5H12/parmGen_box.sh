#!/bin/sh
#
## Run leap

export AMBERHOME=/home/qwang/amber/amber12_x11_build
export AMBER2=/home/qwang/amber/amber12_master_mm1  




cat > input_leap <<EOF

source leaprc.ff99SBildn
source /home/xuedong/Silicon/example/leaprc.gaff2

loadamberprep   ../prepc/C5H12.prepc

loadamberparams C5H12.frcmod

mol4 = loadpdb C5H12_216.pdb

setbox mol4 vdw 

               
saveamberparm mol4 C5H12_216.prmtop      C5H12_216.inpcrd 

quit

EOF

# Run tleap
$AMBERHOME/bin/tleap -f ./input_leap

#done
