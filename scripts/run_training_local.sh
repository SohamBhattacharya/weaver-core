#!/bin/bash

export PYTHONPATH=$PYTHONPATH:/nfs/dust/cms/user/sobhatta/work/TopTagPol/weaver-core
MODELDIR="/nfs/dust/cms/user/sobhatta/work/TopTagPol/weaver-core/output/testrun/{auto}"

#--data-train "/pnfs/desy.de/cms/tier2/store/user/sobhatta/TopTagPol/DeepNtuples/v0/*/*/*/*/output_*.root" \
#--data-test  "/pnfs/desy.de/cms/tier2/store/user/sobhatta/TopTagPol/DeepNtuples/v0/*/*/*/*/output_*.root" \

#python weaver/train.py \
#--data-train \
#    TTJets_HT-600to800:/pnfs/desy.de/cms/tier2/store/user/sobhatta/TopTagPol/DeepNtuples/v1/TTJets_HT-600to800_TuneCP5_13TeV-madgraphMLM-pythia8/DeepNtuplesAK8-v1_RunIISummer20UL18MiniAODv2-106X_v16-v2/220914_115302/*/*.root \
#    QCD_Pt_470to600:/pnfs/desy.de/cms/tier2/store/user/sobhatta/TopTagPol/DeepNtuples/v1/QCD_Pt_470to600_TuneCP5_13TeV_pythia8/DeepNtuplesAK8-v1_RunIISummer20UL18MiniAODv2-106X_v16-v1/220914_113620/*/*.root \
#--data-test \
#    TTJets_HT-600to800:/pnfs/desy.de/cms/tier2/store/user/sobhatta/TopTagPol/DeepNtuples/v1/TTJets_HT-600to800_TuneCP5_13TeV-madgraphMLM-pythia8/DeepNtuplesAK8-v1_RunIISummer20UL18MiniAODv2-106X_v16-v2/220914_115302/*/*.root \
#    QCD_Pt_470to600:/pnfs/desy.de/cms/tier2/store/user/sobhatta/TopTagPol/DeepNtuples/v1/QCD_Pt_470to600_TuneCP5_13TeV_pythia8/DeepNtuplesAK8-v1_RunIISummer20UL18MiniAODv2-106X_v16-v1/220914_113620/*/*.root \
#--data-config data/ak8_points_pf_sv_full.yaml \
#--network-config weaver/networks/particle_net_pf_sv.py \
#--model-prefix /nfs/dust/cms/user/sobhatta/work/TopTagPol/weaver-core/output/testrun_{auto}/result \
#--predict-output prediction_output.root \
#--gpus 0 \
#--batch-size 512 \
#--start-lr 5e-3 \
#--num-epochs 2 \
#--optimizer ranger \
#--num-workers 10 \
#--tensorboard "_tensorboard" \
#--log logs/train.log \
#--demo \


#--demo
#--infile-prefix "root://dcache-cms-xrootd.desy.de/" \


python weaver/train.py \
--data-train \
    TTJets_HT-600to800:/pnfs/desy.de/cms/tier2/store/user/sobhatta/TopTagPol/DeepNtuples/v1/TTJets_HT-600to800_TuneCP5_13TeV-madgraphMLM-pythia8/DeepNtuplesAK8-v1_RunIISummer20UL18MiniAODv2-106X_v16-v2/220914_115302/*/*.root \
    QCD_Pt_470to600:/pnfs/desy.de/cms/tier2/store/user/sobhatta/TopTagPol/DeepNtuples/v1/QCD_Pt_470to600_TuneCP5_13TeV_pythia8/DeepNtuplesAK8-v1_RunIISummer20UL18MiniAODv2-106X_v16-v1/220914_113620/*/*.root \
--data-config data/ak8_points_pf_sv_full.yaml \
--network-config weaver/networks/particle_net_pf_sv.py \
--model-prefix $MODELDIR/result \
--gpus 0 \
--batch-size 512 \
--start-lr 5e-3 \
--num-epochs 2 \
--optimizer ranger \
--num-workers 5 \
--tensorboard "tensorboard/testrun" \
--log logs/{auto}.log \
--demo \
