#!/bin/bash

MODELNAME=$1

if [ -z "${MODELNAME}" ]; then
    echo "[ERROR] Model name not provided: should be the 1st argument."
    echo "Exiting."
    exit
fi

# Provide multiple arguments in quotes. For e.g. "--arg1 --arg2"
SCRIPTARGS=$2

MODELSTATE="output/"$MODELNAME"/""result_best_epoch_state.pt"
NETWORKCONFIG="condor_jobs/training/"$MODELNAME"/particle_net_pf_sv.py"
DATACONFIG="condor_jobs/training/"$MODELNAME"/ak8_points_pf_sv_full.yaml"
SAMPLETAG="DeepNtuplesAK8-v6"
SAMPLELIST="configs/ntuplelists/"$SAMPLETAG"_for-prediction_topTag.txt"

FLIST=( $MODELSTATE $NETWORKCONFIG $DATACONFIG $SAMPLELIST )
file_missing=false

for f in "${FLIST[@]}"; do
    if [ ! -f "$f" ]; then
        echo "[ERROR] Cannot find file: $f"
        file_missing=true
    fi
done

if [ "$file_missing" = true ]; then
    echo "Exiting."
    exit
fi

./scripts/submit_condor_prediction.py \
--modelname $MODELNAME \
--modelstate $MODELSTATE \
--networkconfig $NETWORKCONFIG \
--dataconfig $DATACONFIG \
--samples `cat $SAMPLELIST` \
--sampletag $SAMPLETAG \
$SCRIPTARGS

#echo $SCRIPTARGS
