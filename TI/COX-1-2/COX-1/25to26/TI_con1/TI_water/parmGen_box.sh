#!/bin/sh
#
## Run leap

export AMBERHOME=/home/qwang/amber/amber12_x11_build

#do
cat > input_leap <<EOF

source leaprc.ff99SBildn
source ../../../../../../leaprc.gaff2


loadamberprep     ../../../../lig_params_25to26/25.TI.prepc
loadamberparams   ../../../../lig_params_25to26/25.frcmod
loadamberprep     ../../../../lig_params_25to26/26.TI.prepc
loadamberparams   ../../../../lig_params_25to26/26.frcmod
loadamberparams ../../../../../../silicon_params_set3.frcmod 

comp1 = loadpdb tmp.pdb
solvateoct comp1 TIP3PBOX 15.0
charge comp1

savepdb comp1 TI.25.26.water.pdb
saveamberparm comp1 TI.25.26.water.prmtop TI.25.26.water.inpcrd

quit

EOF

# Run tleap
$AMBERHOME/bin/tleap -f ./input_leap

##done
