#!/bin/sh
#
## Run leap

export AMBERHOME=/home/qwang/amber/amber16_gpu_mm2
export amberexe=/home/qwang/amber/amber12_x11_build

cat > input_leap <<EOF

source leaprc.ff99SBildn
source ../../../../../leaprc.gaff2

loadamberprep     ../../33.TI.prepc
loadamberparams   ../../33.frcmod

loadamberprep     ../../34.TI.prepc
loadamberparams ../../../../../silicon_params_set3.frcmod 


comp1 = loadpdb tmp.pdb 
solvateoct comp1 TIP3PBOX 15.0

charge comp1


savepdb comp1 TI.33.34.water.pdb
saveamberparm comp1 TI.33.34.water.prmtop TI.33.34.water.inpcrd

quit

EOF

# Run tleap
$amberexe/bin/tleap.lipid -f ./input_leap

