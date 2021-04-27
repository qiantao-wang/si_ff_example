#!/bin/sh
#

cat > parmed.in <<EOF

loadRestrt TI.26.27.inpcrd
setOverwrite true
tiMerge :553 :554 :553@C19,H16,H17,Si,C20,H18,H19,H20,C21,H21,H22,H23,C22,H24,H25,H26  :554@C19,H16,H17,C30,C31,Si,C32,H32,H33,H34,C33,H35,H36,H37,C34,H38,H39,H40,H30,H31,H48,H49,
outparm re_TI.26.27.prmtop re_TI.26.27.inpcrd

EOF

# Run parmed
source /home/qwang/amber/amber18_gpu_cuda_80/amber.sh

/home/qwang/amber/amber18_gpu_cuda_80/bin/parmed -p TI.26.27.prmtop -i parmed.in > parmed.log
