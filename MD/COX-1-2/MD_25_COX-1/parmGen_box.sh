#!/bin/sh
#
## Run leap

export AMBERHOME=/home/qwang/amber/amber12_x11_build

#do
cat > input_leap <<EOF

source leaprc.ff99SBildn
source ../../../leaprc.gaff2


loadamberprep     ../25.MD.prepc
loadamberparams   ../25.frcmod

comp1 = loadpdb tmp.pdb

solvateoct comp1 TIP3PBOX 10.0
check comp1
charge comp1

savepdb comp1 25.TIP3P.pdb
saveamberparm comp1 25.TIP3P.prmtop 25.TIP3P.inpcrd

quit

EOF

# Run tleap
$AMBERHOME/bin/tleap -f ./input_leap

##done
