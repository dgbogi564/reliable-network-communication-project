# No loss
python3 receiver.py --port 50009 --pktloss everyn --pktlossN 2 > /dev/null &
R=$!

sleep 0.1s
python3 sender.py --port 50009 > /dev/null &
S=$!

wait $R $S

if cmp -s "test-input.txt" "test-output.txt"; then
    printf "test input: noloss passed\n"
else
    printf "test input: noloss failed\n"
fi

# Packet loss every N packets
python3 receiver.py --port 50009 --pktloss everyn --pktlossN 2 > /dev/null &
R=$!

sleep 0.1s
python3 sender.py --port 50009 > /dev/null &
S=$!

wait $R $S

if cmp -s "test-input.txt" "test-output.txt"; then
    printf "test input: pktloss everyn passed\n"
else
    printf "test input: pktloss everyn failed\n"
fi


# Alternating packet loss every N packets
python3 receiver.py --port 50009 --pktloss alteveryn --pktlossN 4 > /dev/null &
R=$!

sleep 0.1s
python3 sender.py --port 50009 > /dev/null &
S=$!

wait $R $S

if cmp -s "test-input.txt" "test-output.txt"; then
    printf "test input: pktloss alteveryn passed\n"
else
    printf "test input: pktloss alteveryn failed\n"
fi


# ACK loss every N ACKs
python3 receiver.py --port 50009 --ackloss everyn --acklossN 2 > /dev/null &
R=$!

sleep 0.1s
python3 sender.py --port 50009 > /dev/null &
S=$!

wait $R $S

if cmp -s "test-input.txt" "test-output.txt"; then
    printf "test input: ackloss everyn passed\n"
else
    printf "test input: ackloss everyn failed\n"
fi


# Alternating ACK loss every N ACKs
python3 receiver.py --port 50009 --ackloss alteveryn --acklossN 4 > /dev/null &
R=$!

sleep 0.1s
python3 sender.py --port 50009 > /dev/null &
S=$!

wait $R $S

if cmp -s "test-input.txt" "test-output.txt"; then
    printf "test input: ackloss alteveryn passed\n"
else
    printf "test input: ackloss alteveryn failed\n"
fi


# Packet loss every N packets and ACK loss every M ACKs
python3 receiver.py --port 50009 --pktloss everyn --pktlossN 4 --ackloss everyn --acklossN 4 > /dev/null &
R=$!

sleep 0.1s
python3 sender.py --port 50009 > /dev/null &
S=$!

wait $R $S

if cmp -s "test-input.txt" "test-output.txt"; then
    printf "test input: pktloss everyn and ackloss everyn passed\n"
else
    printf "test input: pktloss everyn and ackloss everyn failed\n"
fi


# Alternating packet loss every N packets and alternating ACK loss every M ACKs
python3 receiver.py --port 50009 --pktloss alteveryn --pktlossN 2 --ackloss everyn --acklossN 4 > /dev/null &
R=$!

sleep 0.1s
python3 sender.py --port 50009 > /dev/null &
S=$!

wait $R $S

if cmp -s "test-input.txt" "test-output.txt"; then
    printf "test input: pktloss alteveryn and ackloss everyn passed\n"
else
    printf "test input: pktloss alteveryn and ackloss everyn failed\n"
fi


# Packet loss every N packets and alternating ACK loss every M ACKs
python3 receiver.py --port 50009 --pktloss everyn --pktlossN 4 --ackloss alteveryn --acklossN 4 > /dev/null &
R=$!

sleep 0.1s
python3 sender.py --port 50009 > /dev/null &
S=$!

wait $R $S

if cmp -s "test-input.txt" "test-output.txt"; then
    printf "test input: pktloss everyn and ackloss alteveryn passed\n"
else
    printf "test input: pktloss everyn and ackloss alteveryn failed\n"
fi


# Alternating packet loss every N packets and alternating ACK loss every M ACKs
python3 receiver.py --port 50009 --pktloss alteveryn --pktlossN 2 --ackloss alteveryn --acklossN 4 > /dev/null &
R=$!

sleep 0.1s
python3 sender.py --port 50009 > /dev/null &
S=$!

wait $R $S

if cmp -s "test-input.txt" "test-output.txt"; then
    printf "test input: pktloss alteveryn and ackloss alteveryn passed\n"
else
    printf "test input: pktloss alteveryn and ackloss alteveryn failed\n"
fi