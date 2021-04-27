#!/bin/sh
#

cat > parmed.in <<EOF

loadRestrt TI.25.26.water.inpcrd
setOverwrite true
tiMerge :1 :2 :1@O3,H15  :2@N1,H79,C19,H16,H17,Si,C20,H18,H19,H20,C21,H21,H22,H23,C22,H24,H25,H26
outparm re_TI.25.26.water.prmtop re_TI.25.26.water.inpcrd

EOF

# Run parmed
source /home/qwang/amber/amber18_gpu_cuda_80/amber.sh

/home/qwang/amber/amber18_gpu_cuda_80/bin/parmed -p TI.25.26.water.prmtop -i parmed.in > parmed.log
