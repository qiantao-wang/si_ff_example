#!/bin/sh

###
for i in SiH4_SiH4.con1 SiH4_SiH4.con2 SiH4_water SiH3CH3_SiH3CH3.con1 SiH3CH3_SiH3CH3.con2 SiH3CH3_SiH3CH3.con3 SiH3CH3_water.con1 SiH3CH3_water.con2 SiH3NH2_SiH3NH2.con1 SiH3NH2_SiH3NH2.con2 SiH3NH2_SiH3NH2.con3 SiH3NH2_water.con1 SiH3NH2_water.con2 SiH3OH_SiH3OH.con1 SiH3OH_SiH3OH.con2 SiH3OH_SiH3OH.con3 SiH3OH_water.con1 SiH3OH_water.con2 

do 
cat > ptrajInput.dat <<EOF
trajin rst/$i.rst
#center :538-1189 mass
#image center familiar
#trajin ti_merged.inpcrd
#strip :PA:PC:OL:WAT:Na+:Cl-
trajout $i.new.rst.pdb pdb
EOF

echo $i

/home/qwang/amber/amber12_x11_build/bin/cpptraj -p  ../MM_PES/prmtop/"$i".prmtop \
                                                -i ptrajInput.dat
 
echo done 
done
