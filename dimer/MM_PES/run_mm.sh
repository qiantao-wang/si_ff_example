#!/bin/sh
#

MYAMBER=/home/qwang/amber/amber12_master_mm1

cat > mm.in <<EOF
SP energy
&cntrl
 imin=1, maxcyc=1,
 ntb=0,
 ioutfm=0,
 cut=99,
/
EOF

for n in `ls inpcrd/*.inpcrd`
do 
    mol=`echo $n | awk -F '/' '{print $2}' | head -c -8`
    mmm=`echo $mol | head -c -5`
    #echo $mmm

    $MYAMBER/bin/sander -O -i mm.in \
                           -o output/$mol.out \
                           -p prmtop/$mmm.prmtop \
                           -c inpcrd/$mol.inpcrd
done
