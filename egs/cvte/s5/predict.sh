audio=data/wav/00030

decode_dir=work

mkdir -p $decode_dir
echo "decode_dir is : " $decode_dir
# make an input .scp file
> $decode_dir/input.scp
for f in $audio/*.wav; do
      bf=`basename $f`
      bf=${bf%.wav}
      echo $bf $f >> $decode_dir/input.scp
done


#../../../src/online2bin/online2-wav-nnet3-latgen-faster  \
#    --do-endpointing=false \
#    --online=false \
#    --feature-type=fbank \
#    --fbank-config=../s5/conf/fbank.conf \
#    --max-active=7000 \
#    --beam=15.0 \
#    --lattice-beam=6.0 \
#    --acoustic-scale=1.0 \
#    --word-symbol-table=../s5/exp/chain/tdnn/graph/words.txt \
#    ../s5/exp/chain/tdnn/final.mdl ../s5/exp/chain/tdnn/graph/HCLG.fst  \
#    scp:$decode_dir/input.scp \



wave_name="2017_03_07_16.57.22_1175.wav"
wave_name="2017_03_07_16.59.42_5013.wav"
wave_name="2017_03_07_16.59.16_7980.wav"

../../../src/online2bin/online2-wav-nnet3-latgen-faster  \
    --do-endpointing=false \
    --online=false \
    --feature-type=fbank \
    --fbank-config=../s5/conf/fbank.conf \
    --max-active=7000 \
    --beam=15.0 \
    --lattice-beam=6.0 \
    --acoustic-scale=1.0 \
    --word-symbol-table=../s5/exp/chain/tdnn/graph/words.txt \
    ../s5/exp/chain/tdnn/final.mdl ../s5/exp/chain/tdnn/graph/HCLG.fst 'ark:echo utter1 utter1|' 'scp:echo utter1 ../s5/data/wav/mydata/4.wav|' ark:/dev/null





