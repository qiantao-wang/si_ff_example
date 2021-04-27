#!/bin/sh
#
## Run antechamber

export AMBERHOME=/home/qwang/amber/amber12_x11_build

for mol in 12
do

    ## Get the prep and parm files
    $AMBERHOME/bin/antechamber -i "$mol".pdb -fi pdb -o "$mol".prepc -fo prepc -c bcc -rn LIG -pf y -s 2 
    $AMBERHOME/bin/parmchk -i "$mol".prepc -f prepc -o "$mol".frcmod
    
    ## Get the dummy prep and parm files for nocharge
    #$AMBERHOME/bin/antechamber -i "$mol".pdb -fi pdb -o "$mol".prepc -fo prepc -pf y
    #$AMBERHOME/bin/parmchk -i "$mol".con2.prepc -f prepc -o "$mol".con2.frcmod

    ## Get the dummy prep and parm files for con3
    #$AMBERHOME/bin/antechamber -i "$mol".con3.pdb -fi pdb -o "$mol".con3.prepc -fo prepc -pf y
    #$AMBERHOME/bin/parmchk -i "$mol".con3.prepc -f prepc -o "$mol".con3.frcmod

    ## Get the dummy prep and parm files for con4
    #$AMBERHOME/bin/antechamber -i "$mol".con4.pdb -fi pdb -o "$mol".con4.prepc -fo prepc -pf y
    #$AMBERHOME/bin/parmchk -i "$mol".con4.prepc -f prepc -o "$mol".con4.frcmod

    ## Get the dummy prep and parm files for con5
    #$AMBERHOME/bin/antechamber -i "$mol".con5.pdb -fi pdb -o "$mol".con5.prepc -fo prepc -pf y
    #$AMBERHOME/bin/parmchk -i "$mol".con5.prepc -f prepc -o "$mol".con5.frcmod

    ## Get the dummy prep and parm files for con6
    #$AMBERHOME/bin/antechamber -i "$mol".con6.pdb -fi pdb -o "$mol".con6.prepc -fo prepc -pf y
    #$AMBERHOME/bin/parmchk -i "$mol".con6.prepc -f prepc -o "$mol".con6.frcmod
    
    ## Get the dummy prep and parm files for con7
    #$AMBERHOME/bin/antechamber -i "$mol".con7.pdb -fi pdb -o "$mol".con7.prepc -fo prepc -pf y
    #$AMBERHOME/bin/parmchk -i "$mol".con7.prepc -f prepc -o "$mol".con7.frcmod
    
    ## Get the dummy prep and parm files for con8
    #$AMBERHOME/bin/antechamber -i "$mol".con8.pdb -fi pdb -o "$mol".con8.prepc -fo prepc -pf y
    #$AMBERHOME/bin/parmchk -i "$mol".con8.prepc -f prepc -o "$mol".con8.frcmod
    
    ## Get the dummy prep and parm files for con9
    #$AMBERHOME/bin/antechamber -i "$mol".con9.pdb -fi pdb -o "$mol".con9.prepc -fo prepc -pf y
    #$AMBERHOME/bin/parmchk -i "$mol".con9.prepc -f prepc -o "$mol".con9.frcmod
    
    ## Get the dummy prep and parm files for con10
    #$AMBERHOME/bin/antechamber -i "$mol".con10.pdb -fi pdb -o "$mol".con10.prepc -fo prepc -pf y
    #$AMBERHOME/bin/parmchk -i "$mol".con10.prepc -f prepc -o "$mol".con10.frcmod
    
    ## Get the dummy prep and parm files for con11
    #$AMBERHOME/bin/antechamber -i "$mol".con11.pdb -fi pdb -o "$mol".con11.prepc -fo prepc -pf y
    #$AMBERHOME/bin/parmchk -i "$mol".con11.prepc -f prepc -o "$mol".con11.frcmod
    
    ## Get the dummy prep and parm files for con12
    #$AMBERHOME/bin/antechamber -i "$mol".con12.pdb -fi pdb -o "$mol".con12.prepc -fo prepc -pf y
    #$AMBERHOME/bin/parmchk -i "$mol".con12.prepc -f prepc -o "$mol".con12.frcmod
    
    ## Get the dummy prep and parm files for con13
    #$AMBERHOME/bin/antechamber -i "$mol".con13.pdb -fi pdb -o "$mol".con13.prepc -fo prepc -pf y
    #$AMBERHOME/bin/parmchk -i "$mol".con13.prepc -f prepc -o "$mol".con13.frcmod
    
    ## Get the dummy prep and parm files for con14
    #$AMBERHOME/bin/antechamber -i "$mol".con14.pdb -fi pdb -o "$mol".con14.prepc -fo prepc -pf y
    #$AMBERHOME/bin/parmchk -i "$mol".con14.prepc -f prepc -o "$mol".con14.frcmod
    
    ## Get the dummy prep and parm files for con15
    #$AMBERHOME/bin/antechamber -i "$mol".con15.pdb -fi pdb -o "$mol".con15.prepc -fo prepc -pf y
    #$AMBERHOME/bin/parmchk -i "$mol".con15.prepc -f prepc -o "$mol".con15.frcmod
    
    ## Get the dummy prep and parm files for con21
    #$AMBERHOME/bin/antechamber -i "$mol".con21.pdb -fi pdb -o "$mol".con21.prepc -fo prepc -pf y
    #$AMBERHOME/bin/parmchk -i "$mol".con21.prepc -f prepc -o "$mol".con21.frcmod
    
    ## Get the dummy prep and parm files for con22
    #$AMBERHOME/bin/antechamber -i "$mol".con22.pdb -fi pdb -o "$mol".con22.prepc -fo prepc -pf y
    #$AMBERHOME/bin/parmchk -i "$mol".con22.prepc -f prepc -o "$mol".con22.frcmod
    
    ## Get the dummy prep and parm files for con23
    #$AMBERHOME/bin/antechamber -i "$mol".con23.pdb -fi pdb -o "$mol".con23.prepc -fo prepc -pf y
    #$AMBERHOME/bin/parmchk -i "$mol".con23.prepc -f prepc -o "$mol".con23.frcmod
    
    ## Get the dummy prep and parm files for con24
    #$AMBERHOME/bin/antechamber -i "$mol".con24.pdb -fi pdb -o "$mol".con24.prepc -fo prepc -pf y
    #$AMBERHOME/bin/parmchk -i "$mol".con24.prepc -f prepc -o "$mol".con24.frcmod
    
    ## Get the dummy prep and parm files for con25
    #$AMBERHOME/bin/antechamber -i "$mol".con25.pdb -fi pdb -o "$mol".con25.prepc -fo prepc -pf y
    #$AMBERHOME/bin/parmchk -i "$mol".con25.prepc -f prepc -o "$mol".con25.frcmod





done

