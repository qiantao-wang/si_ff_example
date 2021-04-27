#!/bin/sh
#
## Run leap

export AMBERHOME=/home/qwang/amber/amber12_x11_build
export AMBER2=/home/qwang/amber/amber12_master_mm1  




cat > input_leap <<EOF

source leaprc.ff99SBildn
source /home/xuedong/Silicon/example/leaprc.gaff2

loadamberprep   14.prepc
loadamberparams ~/Silicon/example/silicon_params_set3.frcmod

mol=loadpdb 14.pdb

saveamberparm mol 14.prmtop 14.inpcrd 

quit

EOF

# Run tleap
$AMBERHOME/bin/tleap -f ./input_leap

#done
