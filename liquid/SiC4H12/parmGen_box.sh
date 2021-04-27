#!/bin/sh
#
## Run leap

export AMBERHOME=/home/qwang/amber/amber12_x11_build
export AMBER2=/home/qwang/amber/amber12_master_mm1  




cat > input_leap <<EOF

source leaprc.ff99SBildn
source /home/xuedong/Silicon/example/leaprc.gaff2

loadamberprep   ../prepc/SiC4H12.prepc
loadamberparams ../../silicon_params_set3.frcmod

mol = loadpdb SiC4H12_216.pdb

setbox mol vdw 

               
saveamberparm mol SiC4H12_216.prmtop    SiC4H12_216.inpcrd 

quit

EOF

# Run tleap
$AMBERHOME/bin/tleap -f ./input_leap

#done
