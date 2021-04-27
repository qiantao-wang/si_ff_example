#!/bin/sh
#

cat > parmed.in <<EOF

loadRestrt TI.23.24.inpcrd
setOverwrite true
tiMerge :222 :223 :222@C14,O2,H11,C15,H12,H13,H14,C16,H15,H16,H17 :223@Si,O2,H11,C15,H12,H13,H14,C16,H15,H16,H17
outparm re_TI.23.24.prmtop re_TI.23.24.inpcrd

EOF

# Run parmed
source /home/qwang/amber/amber18_gpu_cuda_80/amber.sh

/home/qwang/amber/amber18_gpu_cuda_80/bin/parmed -p TI.23.24.prmtop -i parmed.in > parmed.log
