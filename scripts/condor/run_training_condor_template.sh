#!/bin/bash

CWD="@cwd@"

cd $CWD

# Initialize the environment
source  /afs/desy.de/user/s/sobhatta/.local/bin/init-weaver.sh  $CWD

MODELNAME="@auto@"
MODELDIR="/nfs/dust/cms/user/sobhatta/work/TopTagPol/weaver-core/output/$MODELNAME"

python -u weaver/train.py \
--data-train \
QCD:\
/pnfs/desy.de/cms/tier2/store/user/sobhatta/TopTagPol/DeepNtuples/v1/QCD_Pt_300to470_TuneCP5_13TeV_pythia8/*/*/*/*.root,\
/pnfs/desy.de/cms/tier2/store/user/sobhatta/TopTagPol/DeepNtuples/v1/QCD_Pt_470to600_TuneCP5_13TeV_pythia8/*/*/*/*.root,\
/pnfs/desy.de/cms/tier2/store/user/sobhatta/TopTagPol/DeepNtuples/v1/QCD_Pt_600to800_TuneCP5_13TeV_pythia8/*/*/*/*.root,\
/pnfs/desy.de/cms/tier2/store/user/sobhatta/TopTagPol/DeepNtuples/v1/QCD_Pt_800to1000_TuneCP5_13TeV_pythia8/*/*/*/*.root,\
/pnfs/desy.de/cms/tier2/store/user/sobhatta/TopTagPol/DeepNtuples/v1/QCD_Pt_1000to1400_TuneCP5_13TeV_pythia8/*/*/*/*.root,\
/pnfs/desy.de/cms/tier2/store/user/sobhatta/TopTagPol/DeepNtuples/v1/QCD_Pt_1400to1800_TuneCP5_13TeV_pythia8/*/*/*/*.root,\
/pnfs/desy.de/cms/tier2/store/user/sobhatta/TopTagPol/DeepNtuples/v1/QCD_Pt_1800to2400_TuneCP5_13TeV_pythia8/*/*/*/*.root,\
/pnfs/desy.de/cms/tier2/store/user/sobhatta/TopTagPol/DeepNtuples/v1/QCD_Pt_2400to3200_TuneCP5_13TeV_pythia8/*/*/*/*.root,\
/pnfs/desy.de/cms/tier2/store/user/sobhatta/TopTagPol/DeepNtuples/v1/QCD_Pt_3200toInf_TuneCP5_13TeV_pythia8/*/*/*/*.root,\
 \
TT:/pnfs/desy.de/cms/tier2/store/user/sobhatta/TopTagPol/DeepNtuples/v1/TT*/*/*/*/*.root \
Zprime:/pnfs/desy.de/cms/tier2/store/user/sobhatta/TopTagPol/DeepNtuples/v1/Zprime*/*/*/*/*.root \
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


#QCD_Pt_3200toInf_TuneCP5_13TeV_pythia8:/pnfs/desy.de/cms/tier2/store/user/sobhatta/TopTagPol/DeepNtuples/v1/QCD_Pt_3200toInf_TuneCP5_13TeV_pythia8/DeepNtuplesAK8-v1_RunIISummer20UL18MiniAODv2-106X_v16-v1/220914_113715/*/*.root \


#TTJets_HT-600to800:/pnfs/desy.de/cms/tier2/store/user/sobhatta/TopTagPol/DeepNtuples/v1/TTJets_HT-600to800_TuneCP5_13TeV-madgraphMLM-pythia8/DeepNtuplesAK8-v1_RunIISummer20UL18MiniAODv2-106X_v16-v2/220914_115302/*/*.root \
#QCD_Pt_470to600:/pnfs/desy.de/cms/tier2/store/user/sobhatta/TopTagPol/DeepNtuples/v1/QCD_Pt_470to600_TuneCP5_13TeV_pythia8/DeepNtuplesAK8-v1_RunIISummer20UL18MiniAODv2-106X_v16-v1/220914_113620/*/*.root \
