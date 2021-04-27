#!/bin/sh
#

### running CUDA 8.0 on gm2
 export AMBERHOME=/home/qwang/amber/amber16_gpu_cuda_80
 export PATH=$AMBERHOME/bin:$PATH
 export LD_LIBRARY_PATH=$AMBERHOME/lib:$LD_LIBRARY_PATH
 export CUDA_HOME=/usr/local/cuda-8.0

 export CUDADIR=/usr/local/cuda-8.0
 export PATH=$CUDADIR/bin:$PATH
 export LD_LIBRARY_PATH=$CUDADIR/lib64:$LD_LIBRARY_PATH
 
 export CUDA_VISIBLE_DEVICES=1


### running CUDA 6.5 on gm1
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
#$AMBERHOME/amber.sh

for i in 1.0 0.9 0.8 0.7 0.6 0.5 0.4 0.3 0.2 0.1 0.0
do

j=`echo "$i * 100000" | bc -l`
k=`printf "%8.0f" $j`

cat > inp/TI.nvt.$i.in << EOF
Constant volume MD 
&cntrl
 imin=0,
 nstlim=50000, dt=0.001,
 irest=0, ntx=1,
 ntpr=5000, ntwr=5000, ntwx=5000, 
 ntave=10000,
 ioutfm=0, iwrap=0,
 ntt=3, gamma_ln=3, ig=$k,
 ntb=1, ntp=0,
 tempi=0.0, temp0=300.0,
 ntc=2, ntf=1,
 cut=10.0,
 icfe=1, ifsc=1,
 clambda=$i,
timask1=':1',
scmask1=':1',
 tishake=1,
/
EOF

echo $i

my_amber=/home/qwang/amber/amber18_gpu_cuda_80

$my_amber/bin/pmemd.cuda -O -i inp/TI.nvt.$i.in \
                            -o out/SiC4H12.TIP3P.nvt.$i.out \
                            -p SiC4H12.TIP3P.prmtop \
                            -c SiC4H12.TIP3P.npt.rst \
                            -r rst/SiC4H12.TIP3P.nvt.$i.rst \
                            -x mdcrd/SiC4H12.TIP3P.nvt.$i.mdcrd 
       #                     -x mdcrd/SiC4H12.TIP3P.nvt.$i.mdcrd \
       #>& /dev/null 

echo done $i
done
#
