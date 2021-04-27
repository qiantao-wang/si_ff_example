#!/bin/sh
#
#

cat > mm.in <<EOF
Minimization
&cntrl
 imin=1, maxcyc=1, 
 ntb=0,
 ioutfm=0, 
 cut=99,
/
EOF

for i in 000 030 060 090 120 150 180
do
    m="9."$i".inpcrd"
    n="9."$i".out"
    echo $n

    my_amber=/home/qwang/amber/amber12_master_mm1
    
    mpirun -np 1 \
    $my_amber/bin/sander.MPI -O -i mm.in \
                                -o $n \
                                -p 9.prmtop \
                                -c $m \
           >& /dev/null

done

