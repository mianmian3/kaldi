# 注意：需要[ --add_pitch=true ]加入pitch特征。
# steps/online/nnet3/prepare_online_decoding.sh --add_pitch true data/lang_chain exp/nnet3/extractor exp/chain/tdnn_1a_sp exp/chain/nnet_online

. ./cmd.sh
. ./path.sh
. ./utils/parse_options.sh


# apply-cmvn-online
# configuration file for apply-cmvn-online, used when invoking online2-wav-nnet3-latgen-faster.


#decode
#apply-cmvn-online 


online2-wav-nnet3-latgen-faster \
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
#    > log/log_online_true  2>&1  &
#
#
#
#

#    --config=exp/chain/nnet_online/conf/online.conf \

#online2-wav-nnet3-latgen-faster \
#     --config=exp/chain/tdnn_1a_sp_online/conf/online.conf \
#    --do-endpointing=false \
#    --frames-per-chunk=20 \
#    --extra-left-context-initial=0 \
#    --online=false \
#    --frame-subsampling-factor=3 \
#    --min-active=200 \
#    --max-active=7000 \
#    --beam=15.0 \
#    --lattice-beam=6.0 \
#    --acoustic-scale=1.0 \
#    --word-symbol-table=data/lang/words.txt \
#    exp/chain/tdnn_2a_sp/final.mdl \
#    exp/chain/tdnn_2a_sp/graph/HCLG.fst \
#    ark:data/test/spk2utt \
#    scp:data/test/wav.scp \
#    ark,t:log/log_online_false.txt \
#> log/log_online_false  2>&1  & 





    #--online-ivector-period=10 \
    #--extra-left-context=0 \
    #--extra-right-context=0 \
    #--extra-right-context-final=-1 \
    #--extra-left-context-initial=-1 \
    #--config=exp/chain/nnet_online/conf/online.conf \


 
#online2-wav-nnet3-latgen-faster \
#   --config=exp/chain/tdnn_1a_sp_online/conf/online.conf \
#   --online=true \
#   --extra-left-context-initial=0 \
#   --frame-subsampling-factor=3 \
#   --frames-per-chunk=50 \
#   --minimize=false \
#   --max-active=7000 \
#   --min-active=200 \
#   --beam=15.0 \
#   --lattice-beam=8.0 \
#   --acoustic-scale=1.0 \
#   --word-symbol-table=data/lang/words.txt \
#    exp/chain/tdnn_2a_sp/final.mdl \
#    exp/chain/tdnn_2a_sp/graph/HCLG.fst \
#    ark:data/test/spk2utt \
#    scp:data/test/wav.scp \
#    ark,t:log/log_online_false_same.txt \
#> log/log_2a_sp  2>&1  & 



