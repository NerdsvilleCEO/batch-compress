#source "${BATS_TEST_DIRNAME}/../compress.sh" >/dev/null 2>/dev/null

# Guard against duplicate run due to bats internals
if [ -z "$BATCH_COMPRESS_TEST_DIR" ]; then
    BATCH_COMPRESS_TEST_DIR="${BATS_TMPDIR}/batch_compress"
    export BATCH_COMPRESS_TEST_DIR="$(mktemp -d "${BATCH_COMPRESS_TEST_DIR}.XXX" 2>/dev/null || echo "$BATCH_COMPRESS_TEST_DIR")"

    PATH="${BATS_TEST_DIRNAME}/../:$PATH"
    export PATH

fi

teardown() {
    rm -rf "$BATCH_COMPRESS_TEST_DIR"
}
