#!/bin/sh
#
## Run leap

export AMBERHOME=/home/qwang/amber/amber16_gpu_mm2
export amberexe=/home/qwang/amber/amber12_x11_build

cat > input_leap <<EOF

source leaprc.ff99SBildn
source ../../../../leaprc.gaff2

loadamberprep     ../31.TI.prepc
loadamberparams   ../31.frcmod

loadamberprep     ../32.TI.prepc
loadamberparams ../../../../silicon_params_set3.frcmod 


comp1 = loadpdb tmp.pdb 
set comp1 box {85.392  85.392  85.392}

charge comp1


savepdb comp1 TI.31.32.pdb
saveamberparm comp1 TI.31.32.prmtop TI.31.32.inpcrd

quit

EOF

# Run tleap
$amberexe/bin/tleap.lipid -f ./input_leap

