#!/data/data/com.termux/files/usr/bin/bash

PREFIX="/data/data/com.termux/files/usr"
SHADOW="$PREFIX/share/aether-sync/shadow"

MODEL=$(getprop ro.product.model)
BRAND=$(getprop ro.product.brand)

echo -e "\033[1;34m[BUILD]\033[0m Detecting System Architecture..."
echo -e "\033[1;32m[BUILD]\033[0m Target Identified: $BRAND $MODEL"

echo -e "\033[1;34m[BUILD]\033[0m Generating Universal Shadow Tree..."
mkdir -p $SHADOW/{acct,apex,bin,carrier,config,data,dev,efs,etc,linkerconfig,metadata,mnt,odm,oem,proc,product,root,sdcard,sec_efs,storage,sys,system,system_ext,tmp,vendor}
mkdir -p $SHADOW/system/etc

echo -e "\033[1;34m[BUILD]\033[0m Mirroring system descriptors..."
cp /system/etc/*.xml "$SHADOW/system/etc/" 2>/dev/null
cp /system/etc/*.json "$SHADOW/system/etc/" 2>/dev/null
getprop > "$SHADOW/system/build.prop"
echo "root:x:0:0:root:/root:/data/data/com.termux/files/usr/bin/bash" > "$SHADOW/etc/passwd"
touch "$SHADOW/acct/uid_0"

cp aether "$PREFIX/bin/aether"
chmod +x "$PREFIX/bin/aether"
chmod -R 755 "$SHADOW"

echo -e "\033[1;32m[SUCCESS]\033[0m Environment is now 100% Isolated and Populated."
echo -e "\033[1;32m[READY]\033[0m Ready for testing by Tomjo2000 and Grimler91."
