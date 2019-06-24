
#../../../src/online2bin/online2-tcp-nnet3-decode-faster \
#    --config=exp/chain/nnet_online/conf/online.conf \
#    --frames-per-chunk=20 \
#    --extra-left-context-initial=0 \
#    --frame-subsampling-factor=3 \
#    --min-active=200 \
#    --max-active=7000 \
#    --beam=15.0 \
#    --lattice-beam=6.0 \
#    --acoustic-scale=1.0 \
#    --port-num=5050 \
#    --read-timeout=1 \
#    exp/chain/tdnn_1a_sp/final.mdl \
#    exp/chain/tdnn_1a_sp/graph/HCLG.fst \
#    data/lang/words.txt & 



nohup ../../../src/online2bin/online2-tcp-nnet3-decode-faster \
    --config=exp/chain/nnet_online/conf/online.conf \
    --frames-per-chunk=20 \
    --extra-left-context-initial=0 \
    --frame-subsampling-factor=3 \
    --min-active=200 \
    --max-active=7000 \
    --beam=15.0 \
    --lattice-beam=6.0 \
    --acoustic-scale=1.0 \
    --port-num=5051 \
    --read-timeout=20 \
    exp/chain/tdnn_1a_sp/final.mdl \
    exp/chain/tdnn_1a_sp/graph/HCLG.fst \
    data/lang/words.txt 2> log/online2-tcp-nnet3-decode-faster.log  & 





#sox audio.wav -t raw  - | nc localhost 5050





