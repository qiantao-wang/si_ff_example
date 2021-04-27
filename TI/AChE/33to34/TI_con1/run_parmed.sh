#!/bin/sh
#

cat > parmed.in <<EOF

loadRestrt TI.33.34.inpcrd
setOverwrite true
tiMerge :531 :532 :531@C1,C,H,H1,H2,C2,H3,H4,H5,C3,H6,H7,H8  :532@Si,C,H,H1,H2,C2,H3,H4,H5,C3,H6,H7,H8
outparm re_TI.33.34.prmtop re_TI.33.34.inpcrd

EOF

# Run parmed
source /home/qwang/amber/amber18_gpu_cuda_80/amber.sh

/home/qwang/amber/amber18_gpu_cuda_80/bin/parmed -p TI.33.34.prmtop -i parmed.in > parmed.log
