#!/bin/sh
#

cat > parmed.in <<EOF

loadRestrt TI.23.24.water.inpcrd
setOverwrite true
tiMerge :1 :2 :1@C14,O2,H11,C15,H12,H13,H14,C16,H15,H16,H17 :2@Si,O2,H11,C15,H12,H13,H14,C16,H15,H16,H17
outparm re_TI.23.24.water.prmtop re_TI.23.24.water.inpcrd

EOF

# Run parmed
source /home/qwang/amber/amber18_gpu_cuda_80/amber.sh

/home/qwang/amber/amber18_gpu_cuda_80/bin/parmed -p TI.23.24.water.prmtop -i parmed.in > parmed.log
