#!/bin/sh
#
## Run leap

export AMBERHOME=/home/qwang/amber/amber16_gpu_mm2
export amberexe=/home/qwang/amber/amber12_x11_build

cat > input_leap <<EOF

source leaprc.ff99SBildn
source ~/Silicon/example/leaprc.gaff2

loadamberprep   ../../lig_params/21.TI.prepc
loadamberparams ../../lig_params/21.frcmod

loadamberprep   ../../lig_params/22.TI.prepc
loadamberparams ../../lig_params/22.frcmod
loadamberparams ~/Silicon/example/silicon_params_set3.frcmod 


comp1 = loadpdb tmp.pdb 
solvateoct comp1 TIP3PBOX 15.0


charge comp1


savepdb comp1 TI.21.22.water.pdb
saveamberparm comp1 TI.21.22.water.prmtop TI.21.22.water.inpcrd

quit

EOF

# Run tleap
$amberexe/bin/tleap.lipid -f ./input_leap

