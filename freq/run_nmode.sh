#!/bin/sh
#

export AMBERHOME=/home/qwang/amber/amber12_x11_build
export AMBER2=/home/qwang/amber/amber12_master_mm1

for mol in 1_SiH4 2_SiH3CH3 3_SiH3NH2 4_SiH3OH 7_SiC4H12 8_SiH2CH3NH2 9_SiH2CH3OH 10_Si2H6 11_Si_C3H9_C2H5 12_Si_C3H9_CH3NH2 13_Si_C3H9_CH3OH 14_Si_C3H9_CH2_Ph 15_Si_C3H9_Ph 16_Si_C2H6NH2_Ph 17_Si_C2H6OH_Ph 18_SiC3H9-pyridine 19_SiC3H9-pyrazole 20_SiC3H9CH2-amide 
do

    n=`echo $mol | awk -F "_" '{print $1}'`

    $AMBER2/bin/nmode -O -i nmode.nr.in  -o $n.nmode.nr.out  -p ../torsion/$mol/$n.prmtop -c ../torsion/$mol/$n.000.inpcrd -r $n.nmode.nr.rst
    $AMBER2/bin/nmode -O -i nmode.vib.in -o $n.nmode.vib.out -p ../torsion/$mol/$n.prmtop -c $n.nmode.nr.rst -v $n.nmode.vib.vecs
    
done

