#!/bin/sh
#

cat > gas.in <<EOF
Minimization
&cntrl
 imin=0, 
 nstlim=1000000, dt=0.001,
 irest=0, ntx=1,
 ntpr=1000, ntwr=1000, ntwx=10000, 
 ioutfm=0, iwrap=0,
 ntt=3, gamma_ln=3, ig=77777,
 ntb=0, ntp=0,
 tempi=0.0, temp0=293.15,
 ntc=2, ntf=2,
 cut=9.0,
/
EOF

my_amber=/home/qwang/amber/amber12_master_mm1

mpirun -np 1 \
$my_amber/bin/sander.MPI -O -i gas.in \
                            -o SiC4H12.293.15K.gas.out \
                            -p SiC4H12.prmtop \
                            -c SiC4H12.inpcrd \
                            -r SiC4H12.293.15K.gas.rst

