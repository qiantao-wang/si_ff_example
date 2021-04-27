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
#### running CUDA 6.5 on gm1
#export AMBERHOME=/home/qwang/amber/amber16_gpu_mm2
#export PATH=$AMBERHOME/bin:$PATH
#export LD_LIBRARY_PATH=$AMBERHOME/lib:$LD_LIBRARY_PATH
#export CUDA_HOME=/usr/local/cuda-6.5

#export CUDA_VISIBLE_DEVICES=1

#export PYTHONPATH=/usr/bin/python2.6
#export PYTHONPATH=/usr/bin/python


for i in 1.0 0.9 0.8 0.7 0.6 0.5 0.4 0.3 0.2 0.1 0.0
do

j=`echo "$i * 200000" | bc -l`
k=`printf "%8.0f" $j`

cat > inp/TI.prd1.$i.in << EOF
Constant volume MD 
&cntrl
 imin=0,
 nstlim=2000000, dt=0.001,
 irest=1, ntx=5,
 ntpr=10000, ntwr=500000, ntwx=500000, 
 ntave=50000,
 ioutfm=0, iwrap=0,
 ntt=3, gamma_ln=3, ig=$k,
 ntb=1, ntp=0,
 tempi=300.0, temp0=300.0,
 ntc=2, ntf=1,
 cut=10.0,
 icfe=1, ifsc=1,
 clambda=$i,
timask1='@8944,8945,8946,8947,8948,8949,8950,8951,8952,8953,8954,8955,8956',
timask2='@8961,8962,8963,8964,8965,8966,8967,8968,8969,8970,8971,8972,8973,8974,8975,8976,8977,8978,8979',
scmask1='@8944,8945,8946,8947,8948,8949,8950,8951,8952,8953,8954,8955,8956',
scmask2='@8961,8962,8963,8964,8965,8966,8967,8968,8969,8970,8971,8972,8973,8974,8975,8976,8977,8978,8979',
 tishake=1,
/
EOF

echo $i

my_amber=/home/qwang/amber/amber18_gpu_cuda_80

$my_amber/bin/pmemd.cuda -O -i inp/TI.prd1.$i.in \
                            -o out/SiC4H12.TIP3P.prd1.$i.out \
                            -p SiC4H12.TIP3P.prmtop \
                            -c rst/SiC4H12.TIP3P.npt1.$i.rst \
                            -r rst/SiC4H12.TIP3P.prd1.$i.rst \
                            -x mdcrd/SiC4H12.TIP3P.prd1.$i.mdcrd 
#                            -x mdcrd/TI.ASA-A28.con1.TIP3P.npt.mdcrd \
#       >& /dev/null
 
echo done $i
done
#
