#!/bin/sh
#
## Run leap

export AMBERHOME=/home/qwang/amber/amber12_x11_build

#do
cat > input_leap <<EOF

source leaprc.ff99SBildn
source ../../leaprc.gaff2


loadamberprep     27.MD.prepc
loadamberparams   27.frcmod
loadamberparams   ../../silicon_params_set3.frcmod 

comp1 = loadpdb MD_27_COX-1/tmp.pdb

solvateoct comp1 TIP3PBOX 10.0
check comp1
charge comp1

savepdb comp1 27.TIP3P.pdb
saveamberparm comp1 27.TIP3P.prmtop 27.TIP3P.inpcrd

quit

EOF

# Run tleap
$AMBERHOME/bin/tleap -f ./input_leap

##done
