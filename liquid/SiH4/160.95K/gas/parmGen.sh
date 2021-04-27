#!/bin/sh
#
## Run leap

export AMBERHOME=/home/qwang/amber/amber12_x11_build
export AMBER2=/home/qwang/amber/amber12_master_mm1  




cat > input_leap <<EOF

source leaprc.ff99SBildn
source /home/xuedong/Silicon/example/leaprc.gaff2

loadamberprep    ~/Silicon/example/liquid/prepc/SiH4.prepc
loadamberparams ~/Silicon/example/set3.frcmod

mol=loadpdb SiH4.pdb

saveamberparm mol SiH4.prmtop SiH4.inpcrd 


quit

EOF

# Run tleap
$AMBERHOME/bin/tleap -f ./input_leap

