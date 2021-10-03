#!/bin/bash

cd /tmp

# sorting final zip
ZIP=$(find $(pwd)/rom/out/target/product/${T_DEVICE}/ -maxdepth 1 -name "*${T_DEVICE}*.zip" | perl -e 'print sort { length($b) <=> length($a) } <>' | head -n 1)
ZIPNAME=$(basename ${ZIP})


# final ccache upload
zst_tar ()
{
    time tar "-I zstd -1 -T16" -cf $1.tar.zst $1
    rclone copy --drive-chunk-size 256M --stats 1s $1.tar.zst brrbrr:$1/$rom -P
}


# Let session sleep on error for debug
sleep_on_error()
{
	zst_tar ccache
}

sleep_on_error
