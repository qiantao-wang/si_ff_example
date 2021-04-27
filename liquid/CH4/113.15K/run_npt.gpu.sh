#!/bin/sh
#

## running CUDA 8.0 on gm2
export AMBERHOME=/home/qwang/amber/amber16_gpu_cuda_80
export PATH=$AMBERHOME/bin:$PATH
export LD_LIBRARY_PATH=$AMBERHOME/lib:$LD_LIBRARY_PATH
export CUDA_HOME=/usr/local/cuda-8.0

export CUDADIR=/usr/local/cuda-8.0
 export PATH=$CUDADIR/bin:$PATH
export LD_LIBRARY_PATH=$CUDADIR/lib64:$LD_LIBRARY_PATH

export CUDA_VISIBLE_DEVICES=0
#### running CUDA 6.5 on gm1
#export AMBERHOME=/home/qwang/amber/amber16_gpu_mm2
#export PATH=$AMBERHOME/bin:$PATH
#export LD_LIBRARY_PATH=$AMBERHOME/lib:$LD_LIBRARY_PATH
#export CUDA_HOME=/usr/local/cuda-6.5
#
#export CUDA_VISIBLE_DEVICES=0
#
#export PYTHONPATH=/usr/bin/python2.6
#export PYTHONPATH=/usr/bin/python
#

cat > box.npt.in <<EOF
Minimization
&cntrl
 imin=0,
 nstlim=2000000, dt=0.001,
 irest=0, ntx=1,
 ntpr=2000, ntwr=2000, ntwx=2000,
 ioutfm=0, iwrap=1,
 ntt=3, gamma_ln=3, ig=71111,
 ntb=2, ntp=1,
 pres0=1.0, taup=3.0,
 tempi=113.15, temp0=113.15,
 ntc=2, ntf=2,
 cut=9.0,
/
EOF

my_mpirun='mpirun -np 1'

#$my_mpirun $AMBERHOME/bin/pmemd.cuda_SPFP.MPI \
$my_mpirun $AMBERHOME/bin/pmemd.cuda.MPI \
                  -O -i box.npt.in \
                     -o CH4_216.npt.out \
                     -p ../CH4_216.prmtop \
                     -c CH4_216.heat.rst \
                     -r CH4_216.npt.rst \
                     -x CH4_216.npt.mdcrd \
       >& /dev/null
