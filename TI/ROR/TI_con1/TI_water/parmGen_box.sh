#!/bin/sh
#
## Run leap

export AMBERHOME=/home/qwang/amber/amber16_gpu_mm2
export amberexe=/home/qwang/amber/amber12_x11_build

cat > input_leap <<EOF

source leaprc.ff99SBildn
source ../../../leaprc.gaff2

loadamberprep   ../../lig_params/23.TI.prepc
loadamberparams ../../lig_params/23.frcmod

loadamberprep   ../../lig_params/24.TI.prepc
loadamberparams ../../lig_params/24.frcmod
loadamberparams ../../../silicon_params_set3.frcmod 


comp1 = loadpdb tmp.pdb 
solvateoct comp1 TIP3PBOX 15.0


charge comp1


savepdb comp1 TI.23.24.water.pdb
saveamberparm comp1 TI.23.24.water.prmtop TI.23.24.water.inpcrd

quit

EOF

# Run tleap
$amberexe/bin/tleap.lipid -f ./input_leap

