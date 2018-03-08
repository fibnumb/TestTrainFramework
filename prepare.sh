#!/bin/bash
set -e

NAME=$1
TRAIN=$2
#e.g. PWGJE
SYSTEM=$3
#e.g. Jets_EMC_pp Jets_EMC_pp_MC Jets_EMC_PbPb
TRAINNUMBER=$4
#TestTrain ID 
TAG=$5
#AliPhysics Tag used
RANDOM=$6
#Some random number appended to Test ID.... maybe something to do with the data set???


DIR=tests/$NAME

mkdir ${DIR}
cd ${DIR}

curl -O http://alitrain.cern.ch/train-workdir/${TRAIN}/${SYSTEM}/${TRAINNUMBER}_${TAG}-${RANDOM}/config/MLTrainDefinition.cfg
curl -O http://alitrain.cern.ch/train-workdir/${TRAIN}/${SYSTEM}/${TRAINNUMBER}_${TAG}-${RANDOM}/config/env.sh
curl -O http://alitrain.cern.ch/train-workdir/${TRAIN}/${SYSTEM}/${TRAINNUMBER}_${TAG}-${RANDOM}/config/generator_customization.C
curl -O http://alitrain.cern.ch/train-workdir/${TRAIN}/${SYSTEM}/${TRAINNUMBER}_${TAG}-${RANDOM}/config/globalvariables.C
curl -O http://alitrain.cern.ch/train-workdir/${TRAIN}/${SYSTEM}/${TRAINNUMBER}_${TAG}-${RANDOM}/config/handlers.C
curl -O http://alitrain.cern.ch/train-workdir/${TRAIN}/${SYSTEM}/${TRAINNUMBER}_${TAG}-${RANDOM}/__TRAIN__/lego_train.sh
curl -O http://alitrain.cern.ch/train-workdir/${TRAIN}/${SYSTEM}/${TRAINNUMBER}_${TAG}-${RANDOM}/__TRAIN__/lego_train.C
curl -O http://alitrain.cern.ch/train-workdir/${TRAIN}/${SYSTEM}/${TRAINNUMBER}_${TAG}-${RANDOM}/__TRAIN__/lego_train_merge.sh
curl -O http://alitrain.cern.ch/train-workdir/${TRAIN}/${SYSTEM}/${TRAINNUMBER}_${TAG}-${RANDOM}/__TRAIN__/lego_train_validation.sh
curl -O http://alitrain.cern.ch/train-workdir/${TRAIN}/${SYSTEM}/${TRAINNUMBER}_${TAG}-${RANDOM}/tests.log

cp ../../src/generate.C .
cp ../../src/run.sh .
