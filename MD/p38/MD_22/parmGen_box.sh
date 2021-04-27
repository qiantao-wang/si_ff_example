#!/bin/sh
#
## Run leap

export AMBERHOME=/home/qwang/amber/amber12_x11_build

#do
cat > input_leap <<EOF

source leaprc.ff99SBildn
source  ../../../leaprc.gaff2


loadamberprep     22.MD.prepc
loadamberparams   22.frcmod
loadamberparams ../../../silicon_params_set3.frcmod 

comp1 = loadpdb tmp.pdb

solvateoct comp1 TIP3PBOX 10.0
addions2 comp1 Li+ 7

check comp1
charge comp1

savepdb comp1 22.TIP3P.pdb
saveamberparm comp1 22.TIP3P.prmtop 22.TIP3P.inpcrd

quit

EOF

# Run tleap
$AMBERHOME/bin/tleap -f ./input_leap

##done
