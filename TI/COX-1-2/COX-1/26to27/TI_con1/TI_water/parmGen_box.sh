#!/bin/sh
#
## Run leap

export AMBERHOME=/home/qwang/amber/amber12_x11_build

#do
cat > input_leap <<EOF

source leaprc.ff99SBildn
source ../../../../../../leaprc.gaff2


loadamberprep     ../../../../lig_params_26to27/26.TI.prepc
loadamberparams   ../../../../lig_params_26to27/26.frcmod
loadamberprep     ../../../../lig_params_26to27/27.TI.prepc
loadamberparams   ../../../../lig_params_26to27/27.frcmod
loadamberparams ../../../../../../silicon_params_set3.frcmod 

comp1 = loadpdb tmp.pdb
solvateoct comp1 TIP3PBOX 15.0
charge comp1

savepdb comp1 TI.26.27.water.pdb
saveamberparm comp1 TI.26.27.water.prmtop TI.26.27.water.inpcrd

quit

EOF

# Run tleap
$AMBERHOME/bin/tleap -f ./input_leap

##done
