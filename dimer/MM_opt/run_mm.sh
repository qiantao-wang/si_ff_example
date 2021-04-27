#!/bin/sh
#
#

my_amber=/home/qwang/amber/amber12_master_mm1
    
cat > mm.in <<EOF
Minimization
&cntrl
 imin=1, maxcyc=5000, 
 ntb=0,
 ioutfm=0, 
 cut=99,
/
EOF

for i in SiH4_SiH4.con1 SiH4_SiH4.con2 SiH4_water SiH3CH3_SiH3CH3.con1 SiH3CH3_SiH3CH3.con2 SiH3CH3_SiH3CH3.con3 SiH3CH3_water.con1 SiH3CH3_water.con2 SiH3NH2_SiH3NH2.con1 SiH3NH2_SiH3NH2.con2 SiH3NH2_SiH3NH2.con3 SiH3NH2_water.con1 SiH3NH2_water.con2 SiH3OH_SiH3OH.con1 SiH3OH_SiH3OH.con2 SiH3OH_SiH3OH.con3 SiH3OH_water.con1 SiH3OH_water.con2
          
do
    #echo $n
    mpirun -np 1 $my_amber/bin/sander.MPI -O -i mm.in \
                                             -o out/"$i".out\
                                             -p ../MM_PES/prmtop/"$i".prmtop \
                                             -c ../MM_PES/inpcrd/"$i".100.inpcrd \
                                             -r rst/"$i".rst


done

