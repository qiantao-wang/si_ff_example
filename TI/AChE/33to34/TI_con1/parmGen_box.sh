#!/bin/sh
#
## Run leap

export AMBERHOME=/home/qwang/amber/amber16_gpu_mm2
export amberexe=/home/qwang/amber/amber12_x11_build

cat > input_leap <<EOF

source leaprc.ff99SBildn
#source leaprc.gaff
source ~/Silicon/si-params/leaprc.gaff2
#source leaprc.lipid14
#loadamberparams frcmod.ionsjc_tip3p

loadamberprep     ../33.TI.prepc
loadamberparams   ../33.frcmod

loadamberprep     ../34.TI.prepc
loadamberparams ~/Silicon/example/silicon_params_set3.frcmod 


comp1 = loadpdb tmp.pdb 

charge comp1

set comp1 box {85.3646630  85.3646630  85.3646630 }

savepdb comp1 TI.33.34.pdb
saveamberparm comp1 TI.33.34.prmtop TI.33.34.inpcrd

quit

EOF

# Run tleap
$amberexe/bin/tleap.lipid -f ./input_leap

