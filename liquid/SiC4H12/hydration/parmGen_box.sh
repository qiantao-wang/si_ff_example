#!/bin/sh
#
## Run leap

export AMBERHOME=/home/qwang/amber/amber16_gpu_mm2
export amberexe=/home/qwang/amber/amber12_x11_build

cat > input_leap <<EOF
source leaprc.ff99SBildn
source ~/Silicon/si-params/leaprc.gaff2


loadamberprep   ../../../torsion/7_SiC4H12/7.prepc
loadamberparams ../../../silicon_params_set3.frcmod 

comp1 = loadpdb  tmp.pdb 

solvateoct comp1 TIP3PBOX 20.0
charge comp1

savepdb comp1 tmp.SiC4H12.TIP3P.pdb
saveamberparm comp1 SiC4H12.TIP3P.prmtop  SiC4H12.TIP3P.inpcrd

quit

EOF

# Run tleap
$amberexe/bin/tleap.lipid -f ./input_leap

