#!/bin/csh

bruk2pipe -verb -in ./ser \
  -bad 0.0 -ext -aswap -AMX -decim 1560 -dspfvs 21 -grpdly 76  \
  -xN              3072  -yN               256  \
  -xT              1536  -yT               128  \
  -xMODE            DQD  -yMODE        Complex  \
  -xSW        12820.513  -ySW         3822.630  \
  -xOBS         800.060  -yOBS         201.179  \
  -xCAR           0.600  -yCAR           16.5  \
  -xLAB              1H  -yLAB             13C  \
  -ndim               2  -aq2D         Complex  \
  -out ./test.fid -ov

nmrPipe -in test.fid \
| nmrPipe -fn EM -lb 5 -c 0.5 \
| nmrPipe -fn ZF -zf 1 -auto \
| nmrPipe -fn FT -verb \
| nmrPipe -fn PS -p0 -123.0 -p1 0.0 -di \
| nmrPipe -fn EXT -x1 2ppm -xn -1ppm -sw \
| nmrPipe -fn TP \
| nmrPipe -fn EM -lb 5 -c 1.0 \
| nmrPipe -fn ZF -zf 1 -auto \
| nmrPipe -fn FT -alt -verb \
| nmrPipe -fn PS -p0 -90.0 -p1 180.0 -di \
  -out test.ft2 -ov
