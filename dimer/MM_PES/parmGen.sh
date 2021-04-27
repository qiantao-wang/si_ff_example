#!/bin/sh
#

export AMBERHOME=/home/qwang/amber/amber12_x11_build
export AMBER2=/home/qwang/amber/amber12_master_mm1  


cat > input_leap <<EOF

source leaprc.ff99SBildn
source /home/xuedong/Silicon/example/leaprc.gaff2

loadamberprep ../../torsion/1_SiH4/1.prepc
loadamberprep ../../torsion/2_SiH3CH3/2.prepc
loadamberprep ../../torsion/3_SiH3NH2/3.prepc
loadamberprep ../../torsion/4_SiH3OH/4.prepc

loadamberparams ../../silicon_params_set3.frcmod

mol1 = loadpdb ../pdb/SiH4_SiH4.con1.TZ.opt.pdb
mol2 = loadpdb ../pdb/SiH4_SiH4.con2.TZ.opt.pdb
mol3 = loadpdb ../pdb/SiH4_water.TZ.opt.pdb

saveamberparm mol1 prmtop/SiH4_SiH4.con1.prmtop tmp.inpcrd 
saveamberparm mol2 prmtop/SiH4_SiH4.con2.prmtop tmp.inpcrd 
saveamberparm mol3 prmtop/SiH4_water.prmtop tmp.inpcrd 


mol5 = loadpdb ../pdb/SiH3CH3_SiH3CH3.con1.TZ.opt.pdb
mol6 = loadpdb ../pdb/SiH3CH3_SiH3CH3.con2.TZ.opt.pdb
mol7 = loadpdb ../pdb/SiH3CH3_SiH3CH3.con3.TZ.opt.pdb
mol8 = loadpdb ../pdb/SiH3CH3_water.con1.TZ.opt.pdb
mol9 = loadpdb ../pdb/SiH3CH3_water.con2.TZ.opt.pdb

saveamberparm mol5 prmtop/SiH3CH3_SiH3CH3.con1.prmtop tmp.inpcrd 
saveamberparm mol6 prmtop/SiH3CH3_SiH3CH3.con2.prmtop tmp.inpcrd 
saveamberparm mol7 prmtop/SiH3CH3_SiH3CH3.con3.prmtop tmp.inpcrd 
saveamberparm mol8 prmtop/SiH3CH3_water.con1.prmtop tmp.inpcrd 
saveamberparm mol9 prmtop/SiH3CH3_water.con2.prmtop tmp.inpcrd 


mol10 = loadpdb ../pdb/SiH3NH2_SiH3NH2.con1.TZ.opt.pdb
mol11 = loadpdb ../pdb/SiH3NH2_SiH3NH2.con2.TZ.opt.pdb
mol12 = loadpdb ../pdb/SiH3NH2_SiH3NH2.con3.TZ.opt.pdb
mol13 = loadpdb ../pdb/SiH3NH2_water.con1.TZ.opt.pdb
mol14 = loadpdb ../pdb/SiH3NH2_water.con2.TZ.opt.pdb

saveamberparm mol10 prmtop/SiH3NH2_SiH3NH2.con1.prmtop tmp.inpcrd 
saveamberparm mol11 prmtop/SiH3NH2_SiH3NH2.con2.prmtop tmp.inpcrd 
saveamberparm mol12 prmtop/SiH3NH2_SiH3NH2.con3.prmtop tmp.inpcrd 
saveamberparm mol13 prmtop/SiH3NH2_water.con1.prmtop tmp.inpcrd 
saveamberparm mol14 prmtop/SiH3NH2_water.con2.prmtop tmp.inpcrd 


mol15 = loadpdb ../pdb/SiH3OH_SiH3OH.con1.TZ.opt.pdb
mol16 = loadpdb ../pdb/SiH3OH_SiH3OH.con2.TZ.opt.pdb
mol17 = loadpdb ../pdb/SiH3OH_SiH3OH.con3.TZ.opt.pdb
mol18 = loadpdb ../pdb/SiH3OH_water.con1.TZ.opt.pdb
mol19 = loadpdb ../pdb/SiH3OH_water.con2.TZ.opt.pdb

saveamberparm mol15 prmtop/SiH3OH_SiH3OH.con1.prmtop tmp.inpcrd 
saveamberparm mol16 prmtop/SiH3OH_SiH3OH.con2.prmtop tmp.inpcrd 
saveamberparm mol17 prmtop/SiH3OH_SiH3OH.con3.prmtop tmp.inpcrd 
saveamberparm mol18 prmtop/SiH3OH_water.con1.prmtop tmp.inpcrd 
saveamberparm mol19 prmtop/SiH3OH_water.con2.prmtop tmp.inpcrd 

quit

EOF

# Run tleap
$AMBERHOME/bin/tleap -f ./input_leap

