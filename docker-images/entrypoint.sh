#!/bin/bash

set -e

HERE="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

COMMAND="python $HERE/generate-site.py gen "

# Do we have a dockerfile or a root?
if [ ! -z "${INPUT_DOCKERFILE}" ]; then
    COMMAND="${COMMAND} --dockerfile ${INPUT_DOCKERFILE}"
elif [ ! -z "${INPUT_ROOT}" ]; then
    COMMAND="${COMMAND} --root ${INPUT_ROOT}"
fi

# Output directory?
if [ ! -z "${INPUT_OUTDIR}" ]; then
    COMMAND="${COMMAND} --outdir ${INPUT_OUTDIR}"
fi

# Size in MB (compressed or raw?)
if [ ! -z "${INPUT_COMPRESSED_SIZE}" ]; then
    COMMAND="${COMMAND} --size ${INPUT_COMPRESSED_SIZE}"
fi

if [ ! -z "${INPUT_RAW_SIZE}" ]; then
    COMMAND="${COMMAND} --raw-size ${INPUT_RAW_SIZE}"
fi

COMMAND="${COMMAND} ${INPUT_CONTAINER}"

echo "${COMMAND}"

${COMMAND}
echo $?