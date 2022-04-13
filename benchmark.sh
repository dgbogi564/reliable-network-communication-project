port=50007

# No loss
python3 receiver.py --port $port --pktloss noloss --ackloss noloss > /dev/null &
R=$!

sleep 0.1s
python3 sender.py --port $port > /dev/null &
S=$!

wait $R $S

if cmp -s "test-input.txt" "test-output.txt"; then
    printf "test-input.txt: noloss passed\n"
else
    printf "test-input.txt: noloss failed\n"
fi

# Packet loss every N packets
python3 receiver.py --port $port --pktloss everyn --pktlossN 2 > /dev/null &
R=$!

sleep 0.1s
python3 sender.py --port $port > /dev/null &
S=$!

wait $R $S

if cmp -s "test-input.txt" "test-output.txt"; then
    printf "test-input.txt: pktloss everyn passed\n"
else
    printf "test-input.txt: pktloss everyn failed\n"
fi


# Alternating packet loss every N packets
python3 receiver.py --port $port --pktloss alteveryn --pktlossN 4 > /dev/null &
R=$!

sleep 0.1s
python3 sender.py --port $port > /dev/null &
S=$!

wait $R $S

if cmp -s "test-input.txt" "test-output.txt"; then
    printf "test-input.txt: pktloss alteveryn passed\n"
else
    printf "test-input.txt: pktloss alteveryn failed\n"
fi


# ACK loss every N ACKs
python3 receiver.py --port $port --ackloss everyn --acklossN 2 > /dev/null &
R=$!

sleep 0.1s
python3 sender.py --port $port > /dev/null &
S=$!

wait $R $S

if cmp -s "test-input.txt" "test-output.txt"; then
    printf "test-input.txt: ackloss everyn passed\n"
else
    printf "test-input.txt: ackloss everyn failed\n"
fi


# Alternating ACK loss every N ACKs
python3 receiver.py --port $port --ackloss alteveryn --acklossN 4 > /dev/null &
R=$!

sleep 0.1s
python3 sender.py --port $port > /dev/null &
S=$!

wait $R $S

if cmp -s "test-input.txt" "test-output.txt"; then
    printf "test-input.txt: ackloss alteveryn passed\n"
else
    printf "test-input.txt: ackloss alteveryn failed\n"
fi


# Packet loss every N packets and ACK loss every M ACKs
python3 receiver.py --port $port --pktloss everyn --pktlossN 4 --ackloss everyn --acklossN 4 > /dev/null &
R=$!

sleep 0.1s
python3 sender.py --port $port > /dev/null &
S=$!

wait $R $S

if cmp -s "test-input.txt" "test-output.txt"; then
    printf "test-input.txt: pktloss everyn and ackloss everyn passed\n"
else
    printf "test-input.txt: pktloss everyn and ackloss everyn failed\n"
fi


# Alternating packet loss every N packets and alternating ACK loss every M ACKs
python3 receiver.py --port $port --pktloss alteveryn --pktlossN 4 --ackloss everyn --acklossN 4 > /dev/null &
R=$!

sleep 0.1s
python3 sender.py --port $port > /dev/null &
S=$!

wait $R $S

if cmp -s "test-input.txt" "test-output.txt"; then
    printf "test-input.txt: pktloss alteveryn and ackloss everyn passed\n"
else
    printf "test-input.txt: pktloss alteveryn and ackloss everyn failed\n"
fi


# Packet loss every N packets and alternating ACK loss every M ACKs
python3 receiver.py --port $port --pktloss everyn --pktlossN 4 --ackloss alteveryn --acklossN 4 > /dev/null &
R=$!

sleep 0.1s
python3 sender.py --port $port > /dev/null &
S=$!

wait $R $S

if cmp -s "test-input.txt" "test-output.txt"; then
    printf "test-input.txt: pktloss everyn and ackloss alteveryn passed\n"
else
    printf "test-input.txt: pktloss everyn and ackloss alteveryn failed\n"
fi


# Alternating packet loss every N packets and alternating ACK loss every M ACKs
python3 receiver.py --port $port --pktloss alteveryn --pktlossN 4 --ackloss alteveryn --acklossN 4 > /dev/null &
R=$!

sleep 0.1s
python3 sender.py --port $port > /dev/null &
S=$!

wait $R $S

if cmp -s "test-input.txt" "test-output.txt"; then
    printf "test-input.txt: pktloss alteveryn and ackloss alteveryn passed\n"
else
    printf "test-input.txt: pktloss alteveryn and ackloss alteveryn failed\n"
fi