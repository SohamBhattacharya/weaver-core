#!/bin/bash

export PYTHONPATH=$PYTHONPATH:/nfs/dust/cms/user/sobhatta/work/TopTagPol/weaver-core

MODELNAME="2023-04-06_23-43-12_particlenet_topLR"
STATENAME="result_best_epoch_state"

DATACFG="condor_jobs/training/"$MODELNAME"/ak8_points_pf_sv_full_topLR_el-mu-vars_forNonWprime.yaml"
NETCFG="condor_jobs/training/"$MODELNAME"/particle_net_pf_sv.py"
MODELSTATE="output/"$MODELNAME"/"$STATENAME".pt"
# OUTPATH="output/"$MODELNAME"/prediction/"$STATENAME"/output.root"
OUTPATH="output/testrun/"$MODELNAME"/prediction/"$STATENAME"/output.root"

python weaver/train.py \
--predict \
--data-test \
TTJets_HT-600to800_TuneCP5_13TeV-madgraphMLM-pythia8%1:/pnfs/desy.de/cms/tier2/store/user/sobhatta/TopTagPol/DeepNtuples/v4/TTJets_HT-600to800_TuneCP5_13TeV-madgraphMLM-pythia8/DeepNtuplesAK8-v4_RunIISummer20UL18MiniAODv2-106X_v16-v2/221207_162221/*/*.root \
--data-config $DATACFG \
--network-config $NETCFG \
--model-prefix $MODELSTATE \
--gpus 0 \
--batch-size 512 \
--num-workers 20 \
--predict-output $OUTPATH
