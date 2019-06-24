# 注意：需要[ --add_pitch=true ]加入pitch特征。
#steps/online/nnet3/prepare_online_decoding.sh --add_pitch true data/lang_chain exp/nnet3/extractor exp/chain/tdnn_1a_sp exp/chain/nnet_online


#mfcc feature add exp/chain/nnet_online/conf/mfcc.conf
#--num-mel-bins=40     # similar to Google's setup.
#--num-ceps=40     # there is no dimensionality reduction.
#--low-freq=40    # low cutoff frequency for mel bins
#--high-freq=-200 # high cutoff frequently,relative to Nyquist of 8000 (=3800)


. ./cmd.sh
. ./path.sh
. ./utils/parse_options.sh


# apply-cmvn-online
# configuration file for apply-cmvn-online, used when invoking online2-wav-nnet3-latgen-faster.


#decode
#apply-cmvn-online 

nohup online2-wav-nnet3-latgen-faster \
    --config=exp/chain/nnet_online/conf/online.conf \
    --do-endpointing=false \
    --frames-per-chunk=20 \
    --extra-left-context-initial=0 \
    --online=true \
    --frame-subsampling-factor=3 \
    --min-active=200 \
    --max-active=7000 \
    --beam=15.0 \
    --lattice-beam=6.0 \
    --acoustic-scale=1.0 \
    --word-symbol-table=data/lang/words.txt \
    exp/chain/tdnn_1a_sp/final.mdl \
    exp/chain/tdnn_1a_sp/graph/HCLG.fst \
    ark:data/test/spk2utt \
    scp:data/test/wav.scp \
    ark,t:log/log_online_true.txt \
    > log/log_online_true  2>&1  &



