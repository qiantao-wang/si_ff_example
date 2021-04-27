#!/bin/sh
#

cat > parmed.in <<EOF

loadRestrt TI.31.32.water.inpcrd
setOverwrite true
tiMerge :1 :2 :1@C1,C,H,H1,H2,C2,H3,H4,H5,C3,H6,H7,H8   :2@Si,C,H,H1,H2,C2,H3,H4,H5,C3,H6,H7,H8
outparm re_TI.31.32.water.prmtop re_TI.31.32.water.inpcrd

EOF

# Run parmed
source /home/qwang/amber/amber18_gpu_cuda_80/amber.sh

/home/qwang/amber/amber18_gpu_cuda_80/bin/parmed -p TI.31.32.water.prmtop -i parmed.in > parmed.log
