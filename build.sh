#!/bin/bash

mkdir -p /tmp/rom
cd /tmp/rom

# export sync start time
SYNC_START=$(date +"%s")


git config --global user.name "TheSanty"
git config --global user.email "sudhiryadav.igi@gmail.com"


# Git cookies
echo "${GIT_COOKIES}" > ~/git_cookies.sh
bash ~/git_cookies.sh


# Rom repo sync & dt ( Add roms and update case functions )
rom_one(){
     repo init --depth=1 --no-repo-verify -u https://github.com/HyconOS/manifest -b eleven -g default,-device,-mips,-darwin,-notdefault
     git clone https://github.com/TheSanty/local_manifests.git -b $rom .repo/local_manifests
     repo sync -c --no-clone-bundle --no-tags --optimized-fetch --force-sync -j$(nproc --all)
     . build/envsetup.sh && lunch aosp_whyred-user
}

rom_two(){
     repo init --depth=1 --no-repo-verify -u https://github.com/Corvus-R/android_manifest.git -b 11 -g default,-device,-mips,-darwin,-notdefault
     git clone https://github.com/TheSanty/local_manifests.git -b $rom .repo/local_manifests
     repo sync -c --no-clone-bundle --no-tags --optimized-fetch --force-sync -j$(nproc --all)
     git clone https://${TOKEN}@github.com/Corvus-R/.certs certs
     export RAVEN_LAIR=Official
     export USE_DEXOPT=true
     . build/envsetup.sh && lunch corvus_whyred-user
}

rom_three(){
     repo init --depth=1 --no-repo-verify -u https://github.com/CherishOS/android_manifest.git -b eleven -g default,-device,-mips,-darwin,-notdefault
     git clone https://github.com/YadavMohit19/local_manifests.git -b $rom .repo/local_manifests
     repo sync -c --no-clone-bundle --no-tags --optimized-fetch --force-sync -j$(nproc --all)
     export WITH_GMS=true
     source build/envsetup.sh && lunch cherish_sakura-userdebug
}

rom_four(){
     repo init --depth=1 --no-repo-verify -u https://github.com/HyconOS/manifest -b eleven -g default,-device,-mips,-darwin,-notdefault
     repo sync -c --no-clone-bundle --no-tags --optimized-fetch --force-sync -j$(nproc --all)
     git clone https://github.com/TheSanty/android_device_xiaomi_whyred.git device/xiaomi/whyred
     export ALLOW_MISSING_DEPENDENCIES=true
     . build/envsetup.sh && lunch aosp_whyred-eng
}

rom_five(){
     repo init --depth=1 --no-repo-verify -u git://github.com/Corvus-R/android_manifest.git -b 11 -g default,-device,-mips,-darwin,-notdefault
     git clone https://${TOKEN}@github.com/YadavMohit19/local_manifests -b $rom .repo/local_manifests
     repo sync -c --no-clone-bundle --no-tags --optimized-fetch --force-sync -j$(nproc --all)
     . build/envsetup.sh && lunch corvus_sakura-user
}

rom_six(){
     repo init --depth=1 --no-repo-verify -u https://github.com/Project-Fluid/manifest.git -b fluid-12 -g default,-device,-mips,-darwin,-notdefault
     git clone https://${TOKEN}@github.com/YadavMohit19/local_manifests -b 12 .repo/local_manifests
     repo sync -c --no-clone-bundle --no-tags --optimized-fetch --force-sync -j$(nproc --all)
     sed -i '104 i \\t"ccache":  Allowed,' build/soong/ui/build/paths/config.go
     export SKIP_ABI_CHECKS=true
     export ALLOW_MISSING_DEPENDENCIES=true
     . build/envsetup.sh && lunch fluid_sakura-eng
}

rom_seven(){
     repo init --depth=1 --no-repo-verify -u https://github.com/ProtonAOSP/android_manifest -b rvc -g default,-device,-mips,-darwin,-notdefault
     git clone https://${TOKEN}@github.com/YadavMohit19/local_manifests -b $rom .repo/local_manifests
     repo sync -c --no-clone-bundle --no-tags --optimized-fetch --force-sync -j$(nproc --all)
     export ALLOW_MISSING_DEPENDENCIES=true && export ALLOW_NINJA_ENV=false
     . build/envsetup.sh && lunch aosp_sakura-eng
}

rom_eight(){
     repo init --depth=1 --no-repo-verify -u https://github.com/Evolution-X/manifest -b elle -g default,-device,-mips,-darwin,-notdefault
     git clone https://${TOKEN}@github.com/YadavMohit19/local_manifests -b evo .repo/local_manifests
     repo sync -c --no-clone-bundle --no-tags --optimized-fetch --force-sync -j$(nproc --all)
     export ALLOW_MISSING_DEPENDENCIES=true
     #export SKIP_ABI_CHECKS=true
     . build/envsetup.sh && lunch evolution_RMX3031-eng
}

rom_nine(){
     repo init --depth=1 --no-repo-verify -u https://github.com/Evolution-X/manifest -b elle -g default,-device,-mips,-darwin,-notdefault
     git clone https://github.com/TheSanty/local_manifests.git -b $rom .repo/local_manifests
     repo sync -c --no-clone-bundle --no-tags --optimized-fetch --force-sync -j$(nproc --all)
     . build/envsetup.sh && lunch evolution_whyred-user
}

rom_ten(){
     repo init --depth=1 -u https://android.googlesource.com/platform/manifest -b android-12.0.0_r2
     git clone https://github.com/TheSanty/local_manifests.git -b $rom .repo/local_manifests
     repo sync
     . build/envsetup.sh && lunch aosp_whyred-userdebug
}

rom_eleven(){
     repo init --depth=1 --no-repo-verify -u https://github.com/PotatoProject/manifest -b frico-release -g default,-device,-mips,-darwin,-notdefault
     git clone https://github.com/TheSanty/local_manifests.git -b $rom .repo/local_manifests
     repo sync -c --no-clone-bundle --no-tags --optimized-fetch --force-sync -j$(nproc --all)
     export ALLOW_MISSING_DEPENDENCIES=true
     source build/envsetup.sh && lunch potato_whyred-userdebug
}

rom_twelve(){
     repo init --depth=1 --no-repo-verify -u https://github.com/Project-Awaken/android_manifest -b 12 -g default,-device,-mips,-darwin,-notdefault
     git clone https://github.com/TheSanty/local_manifests.git -b $rom .repo/local_manifests
     repo sync -c --no-clone-bundle --no-tags --optimized-fetch --force-sync -j$(nproc --all)
     source build/envsetup.sh && lunch awaken_whyred-userdebug
}

recovery_one(){
     repo init --depth=1 --no-repo-verify -u https://github.com/PitchBlackRecoveryProject/manifest_pb -b android-9.0 -g default,-device,-mips,-darwin,-notdefault
     git clone https://${TOKEN}@github.com/YadavMohit19/local_manifests -b $rom .repo/local_manifests
     repo sync -c --no-clone-bundle --no-tags --optimized-fetch --force-sync -j$(nproc --all)
     export ALLOW_MISSING_DEPENDENCIES=true
     source build/envsetup.sh && lunch omni_sakura-eng
}

recovery_two(){
     repo init --depth=1 --no-repo-verify -u https://github.com/PitchBlackRecoveryProject/manifest_pb -b android-11.0 -g default,-device,-mips,-darwin,-notdefault
     git clone https://${TOKEN}@github.com/YadavMohit19/local_manifests -b RMX3031 .repo/local_manifests
     repo sync -c --no-clone-bundle --no-tags --optimized-fetch --force-sync -j$(nproc --all)
     export ALLOW_MISSING_DEPENDENCIES=true
     source build/envsetup.sh && lunch pb_RMX3031-eng
}


# setup TG message and build posts
telegram_message() {
	curl -s -X POST "https://api.telegram.org/bot${BOTTOKEN}/sendMessage" -d chat_id="${CHATID}" \
	-d "parse_mode=Markdown" \
	-d text="$1"
}


telegram_build() {
	curl --progress-bar -F document=@"$1" "https://api.telegram.org/bot${BOTTOKEN}/sendDocument" \
	-F chat_id="${CHATID}" \
	-F "disable_web_page_preview=true" \
	-F "parse_mode=Markdown" \
	-F caption="$2"
}


# Branch name & Head commit sha for ease of tracking
commit_sha() {
    for repo in device/xiaomi/${T_DEVICE} device/xiaomi/sdm660-common vendor/xiaomi kernel/xiaomi/sdm660
    do
	printf "[$(echo $repo | cut -d'/' -f1 )/$(git -C ./$repo/.git rev-parse --short=10 HEAD)]"
    done
}


# Function to be chose based on rom flag in .yml
case "${rom}" in
 "HyconOS") rom_one
    ;;
 "CorvusOS") rom_two
    ;;
 "CherishOS") rom_three
    ;;
 "Hycon") rom_four
    ;;
 "corvus") rom_five
    ;;
 "fluid") rom_six
    ;;
 "proton") rom_seven
    ;;
 "Evo") rom_eight
    ;;
 "EvolutionOS") rom_nine
    ;;
 "aosp") rom_ten
    ;;
 "POSP") rom_eleven
    ;;
 "AwakenOS") rom_twelve
    ;;
 "PBRP") recovery_one
    ;;
 "PB") recovery_two
    ;;
 *) echo "Invalid option!"
    exit 1
    ;;
esac


# export sync end time and diff with sync start
SYNC_END=$(date +"%s")
SDIFF=$((SYNC_END - SYNC_START))


# Send 'Build Triggered' message in TG along with sync time
telegram_message "
	*🌟 $rom Build Triggered 🌟*
	*Date:* \`$(date +"%d-%m-%Y %T")\`
	*✅ Sync finished after $((SDIFF / 60)) minute(s) and $((SDIFF % 60)) seconds*"  &> /dev/null


# export build start time
BUILD_START=$(date +"%s")


# setup ccache
export CCACHE_DIR=/tmp/ccache
export CCACHE_EXEC=$(which ccache)
export USE_CCACHE=1
export CCACHE_COMPRESS=true
export CCACHE_COMPRESSLEVEL=1
export CCACHE_LIMIT_MULTIPLE=0.9
export CCACHE_MAXSIZE=50G
ccache -z


# Build commands for each roms on basis of rom flag in .yml / an additional full build.log is kept.
case "${rom}" in
 "HyconOS") mka bacon -j18 2>&1 | tee build.log
    ;;
 "CorvusOS") make corvus -j18 2>&1 | tee build.log
    ;;
 "CherishOS") mka bacon -j18 2>&1 | tee build.log
    ;;
 "Hycon") mka bacon -j18 2>&1 | tee build.log
    ;;
 "corvus") make corvus 2>&1 | tee build.log
    ;;
 "fluid") mka bacon 2>&1 | tee build.log
    ;;
 "proton") m 2>&1 | tee build.log
    ;;
 "EvolutionOS") mka evolution -j18 2>&1 | tee build.log
    ;;
 "aosp") m -j18 2>&1 | tee build.log
    ;;
 "POSP") brunch whyred -j18 2>&1 | tee build.log
    ;;
 "Evo")  mka evolution -j18 2>&1 | tee build.log
    ;;
 "PBRP") make recoveryimage 2>&1 | tee build.log
    ;;
 "PB") make recoveryimage -j10 2>&1 | tee build.log
    ;;
 *) echo "Invalid option!"
    exit 1
    ;;
esac


ls -a $(pwd)/out/target/product/${T_DEVICE}/ # show /out contents
BUILD_END=$(date +"%s")
DIFF=$((BUILD_END - BUILD_START))


# sorting final zip ( commonized considering ota zips, .md5sum etc with similiar names  in diff roms)
ZIP=$(find $(pwd)/out/target/product/${T_DEVICE}/ -maxdepth 1 -name "*${T_DEVICE}*.zip" | perl -e 'print sort { length($b) <=> length($a) } <>' | head -n 1)
ZIPNAME=$(basename ${ZIP})
ZIPSIZE=$(du -sh ${ZIP} |  awk '{print $1}')
echo "${ZIP}"


# Post Build finished with Time,duration,md5,size&Tdrive link OR post build_error&trimmed build.log in TG
telegram_post(){
 if [ -f $(pwd)/out/target/product/${T_DEVICE}/${ZIPNAME} ]; then
	rclone copy ${ZIP} brrbrr:rom -P
	MD5CHECK=$(md5sum ${ZIP} | cut -d' ' -f1)
	DWD=${TDRIVE}${ZIPNAME}
	telegram_message "
	*✅ Build finished after $(($DIFF / 3600)) hour(s) and $(($DIFF % 3600 / 60)) minute(s) and $(($DIFF % 60)) seconds*

	*ROM:* \`${ZIPNAME}\`
	*MD5 Checksum:* \`${MD5CHECK}\`
	*Download Link:* [Tdrive](${DWD})
	*Size:* \`${ZIPSIZE}\`

	*Commit SHA:* \`$(commit_sha)\`

	*Date:*  \`$(date +"%d-%m-%Y %T")\`" &> /dev/null
 else
	BUILD_LOG=$(pwd)/build.log
	tail -n 10000 ${BUILD_LOG} >> $(pwd)/buildtrim.txt
	LOG1=$(pwd)/buildtrim.txt
	echo "CHECK BUILD LOG" >> $(pwd)/out/build_error
	LOG2=$(pwd)/out/build_error
	TRANSFER=$(curl --upload-file ${LOG1} https://transfer.sh/$(basename ${LOG1}))
	telegram_build ${LOG2} "
	*❌ Build failed to compile after $(($DIFF / 3600)) hour(s) and $(($DIFF % 3600 / 60)) minute(s) and $(($DIFF % 60)) seconds*
	Build Log: ${TRANSFER}

	_Date:  $(date +"%d-%m-%Y %T")_" &> /dev/null
 fi
}

telegram_post
ccache -s
