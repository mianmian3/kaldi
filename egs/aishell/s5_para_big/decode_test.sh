# getting results (see RESULTS file)
for x in exp/*/decode_test; do [ -d $x ] && grep WER $x/cer_* | utils/best_wer.sh; done 2>/dev/null
#for x in exp/*/decode_test; do [ -d $x ] && grep WER $x/wer_* | utils/best_wer.sh; done 2>/dev/null

for x in exp/*/*/decode_test; do [ -d $x ] && grep WER $x/cer_* | utils/best_wer.sh; done 2>/dev/null
#for x in exp/*/*/decode_test; do [ -d $x ] && grep WER $x/wer_* | utils/best_wer.sh; done 2>/dev/null


