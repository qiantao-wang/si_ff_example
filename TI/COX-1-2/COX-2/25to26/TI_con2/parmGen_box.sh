#!/bin/sh
#
## Run leap

export AMBERHOME=/home/qwang/amber/amber12_x11_build

#do
cat > input_leap <<EOF

source leaprc.ff99SBildn
source ../../../../../leaprc.gaff2


loadamberprep     ../../../lig_params_25to26/25.TI.prepc
loadamberparams   ../../../lig_params_25to26/25.frcmod
loadamberprep     ../../../lig_params_25to26/26.TI.prepc
loadamberparams   ../../../lig_params_25to26/26.frcmod
loadamberparams ../../../../../silicon_params_set3.frcmod 

comp1 = loadpdb tmp.pdb

check comp1
charge comp1

set comp1 box {85.7367748  85.7367748  85.7367748}

savepdb comp1 TI.25.26.pdb
saveamberparm comp1 TI.25.26.prmtop TI.25.26.inpcrd

quit

EOF

# Run tleap
$AMBERHOME/bin/tleap -f ./input_leap

##done
