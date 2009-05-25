sr      =       48000
ksmps   =       1
nchnls  =       2

giSineFunc ftgen 1, 0, 65536, 10, 1

instr 1

       ;***** INIT SECTION *****
       iDur            init            p3
       iVol            init            p4
       iStartPitch     init            p5
       iEndPitch       init            p6
       iAttack         init            p7
       iDecay          init            iDur - iAttack

       iPanStart       init            p8
       iPanEnd         init            p9

       ;***** SYNTH SECTION *****
       kEnv            linseg          0, iAttack, iVol, iDecay, 0
       kPitch          expseg          iStartPitch, iDur, iEndPitch
       aSig            oscili          kEnv, kPitch, giSineFunc

       kPan            linseg          iPanStart, iDur, iPanEnd

       aLeft           =               aSig * kPan
       aRight          =               aSig * (1 - kPan)
                       outs            aLeft, aRight
 endin


