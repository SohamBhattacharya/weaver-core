#!/bin/bash

CWD="@cwd@"

cd $CWD

# Initialize the environment
source  /afs/desy.de/user/s/sobhatta/.local/bin/init-weaver.sh  $CWD

MODELNAME="@auto@"
MODELDIR="/nfs/dust/cms/user/sobhatta/work/TopTagPol/weaver-core/output/$MODELNAME"

python -u weaver/train.py \
--data-train \
QCD:/pnfs/desy.de/cms/tier2/store/user/sobhatta/TopTagPol/DeepNtuples/v4/QCD*/*/*/*/*.root \
TT:/pnfs/desy.de/cms/tier2/store/user/sobhatta/TopTagPol/DeepNtuples/v4/TT*/*/*/*/*.root \
Zprime:/pnfs/desy.de/cms/tier2/store/user/sobhatta/TopTagPol/DeepNtuples/v4/Zprime*/*/*/*/*.root \
--infile-prefix "root://dcache-cms-xrootd.desy.de/" \
--data-config @dataconfig@ \
--network-config @networkconfig@ \
--model-prefix "$MODELDIR/result" \
--gpus 0 \
--batch-size 512 \
--start-lr 5e-3 \
--num-epochs 50 \
--optimizer ranger \
--num-workers 30 \
--tensorboard "tensorboard/$MODELNAME" \
--log "$MODELDIR/train.log" \
#--demo \
