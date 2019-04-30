#!/bin/bash

. ./cmd.sh
. ./path.sh

#export train_cmd=run.pl
#export multi_cpu_cmd=run.pl
#export decode_cmd="run.pl --mem 64G"
#export mkgraph_cmd="run.pl --mem 64G"
#export cuda_cmd="$train_cmd --gpu 1"

export KALDI_ROOT=`pwd`/../../..
[ -f $KALDI_ROOT/tools/env.sh ] && . $KALDI_ROOT/tools/env.sh
export PATH=$PWD/utils/:$KALDI_ROOT/tools/openfst/bin:$PWD:$PATH
[ ! -f $KALDI_ROOT/tools/config/common_path.sh ] && echo >&2 "The standard file $KALDI_ROOT/tools/config/common_path.sh is not present -> Exit!" && exit 1
. $KALDI_ROOT/tools/config/common_path.sh
export LC_ALL=C



# step 1: generate fbank features
obj_dir=data/fbank

#data_set='aishell_test'
data_set='test3'
#data_set='audio_dianxiao'

#for x in test; do
for x in $data_set; do
  # rm fbank/$x
  mkdir -p fbank/$x

  # compute fbank without pitch
  steps/make_fbank.sh --nj 1 --cmd "run.pl" $obj_dir/$x exp/make_fbank/$x fbank/$x || exit 1;
  # compute cmvn
  steps/compute_cmvn_stats.sh $obj_dir/$x exp/fbank_cmvn/$x fbank/$x || exit 1;
done
echo "step 1 done!"

# #step 2: offline-decoding
#test_data=data/fbank/test
test_data=data/fbank/$data_set
dir=exp/chain/tdnn

steps/nnet3/decode.sh --acwt 1.0 --post-decode-acwt 10.0 \
  --nj 1 --num-threads 1 \
  --cmd "$decode_cmd" --iter final \
  --frames-per-chunk 50 \
  $dir/graph $test_data $dir/decode_test

echo "step 2 done!"

# # note: the model is trained using "apply-cmvn-online",
# # so you can modify the corresponding code in steps/nnet3/decode.sh to obtain the best performance,
# # but if you directly steps/nnet3/decode.sh, 
# # the performance is also good, but a little poor than the "apply-cmvn-online" method.
