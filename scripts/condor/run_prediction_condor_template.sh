#!/bin/bash

CWD="@cwd@"
MODELNAME="@modelname@"
MODELSTATE="@modelstate@"
DATACFG="@dataconfig@"
NETCFG="@networkconfig@"
SAMPLE="@sample@"
OUTPATH="@outpath@"
GPUS="@gpus@"

cd $CWD

# Initialize the environment
source  /afs/desy.de/user/s/sobhatta/.local/bin/init-weaver.sh  $CWD

python weaver/train.py \
--predict \
--data-test $SAMPLE \
--data-config $DATACFG \
--network-config $NETCFG \
--model-prefix $MODELSTATE \
--batch-size 512 \
--num-workers 20 \
--predict-output $OUTPATH \
--gpus $GPUS \
--infile-prefix "root://dcache-cms-xrootd.desy.de/" \
