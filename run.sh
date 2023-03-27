echo ############# SET PHASE #################
(cd rust-sync && cargo run --bin set)
echo ############# END OF SET PHASE ##########

echo ############# BENCHMARK #################
echo @@@@@@@@@@@@@ NODEJS @@@@@@@@@@@@@@@@@@@@
(cd nodejs && npm run build &>/dev/null && npm run start:release)
echo @@@@@@@@@@@@@ END OF NODEJS @@@@@@@@@@@@@

echo @@@@@@@@@@@@@ PYTHON @@@@@@@@@@@@@@@@@@@@
(cd python && poetry run start)
echo @@@@@@@@@@@@@ END OF PYTHON @@@@@@@@@@@@@

echo @@@@@@@@@@@@@ RUST @@@@@@@@@@@@@@@@@@@@@@
echo @@@@@@@@@@@@@ DEBUG_SYNC @@@@@@@@@@@@@@@@
(cd rust-sync && cargo run)
echo @@@@@@@@@@@@@ END OF DEBUG_SYNC @@@@@@@@@
echo @@@@@@@@@@@@@ DEBUG_TOKIO @@@@@@@@@@@@@@@
(cd rust-tokio && cargo run)
echo @@@@@@@@@@@@@ END OF DEBUG_TOKIO @@@@@@@@
echo @@@@@@@@@@@@@ RELEASE_SYNC @@@@@@@@@@@@@@
(cd rust-sync && cargo build --release &>/dev/null && ./target/release/main)
echo @@@@@@@@@@@@@ END OF RELEASE_SYNC @@@@@@@
echo @@@@@@@@@@@@@ RELEASE_TOKIO @@@@@@@@@@@@@
(cd rust-tokio && cargo build --release &>/dev/null && ./target/release/main)
echo @@@@@@@@@@@@@ END OF RELEASE_TOKIO @@@@@@
echo @@@@@@@@@@@@@ END OF RUST @@@@@@@@@@@@@@@
echo ############# END OF BENCHMARK PHASE ####
