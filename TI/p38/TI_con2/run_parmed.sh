#!/bin/sh
#

cat > parmed.in <<EOF

loadRestrt TI.21.22.inpcrd
setOverwrite true
tiMerge :326 :327 :326@C16,C17,C18,C19,H5,H6,H7,H8,H9,H10,H11,H12,H13  :327@Si,C17,C18,C19,H5,H6,H7,H8,H9,H10,H11,H12,H13
outparm re_TI.21.22.prmtop re_TI.21.22.inpcrd

EOF

# Run parmed
source /home/qwang/amber/amber18_gpu_cuda_80/amber.sh

/home/qwang/amber/amber18_gpu_cuda_80/bin/parmed -p TI.21.22.prmtop -i parmed.in > parmed.log
