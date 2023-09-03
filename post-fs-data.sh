#!/system/bin/sh
MODDIR=${0%/*}


BURP_CERT_HASH=9a5ba575
BURP_CERT_FILE=$(ls /data/misc/user/*/cacerts-added/${BURP_CERT_HASH}.* | (IFS=.; while read -r left right; do echo $right $left.$right; done) | sort -nr | (read -r left right; echo $right))

if [ -e "${BURP_CERT_FILE}" ]; then
    cp -f ${BURP_CERT_FILE} ${MODDIR}/system/etc/security/cacerts/${BURP_CERT_HASH}.0
    rm -f /data/misc/user/*/cacerts-removed/${BURP_CERT_HASH}.*
fi

chown -R 0:0 ${MODDIR}/system/etc/security/cacerts

[ "$(getenforce)" = "Enforcing" ] || exit 0

default_selinux_context=u:object_r:system_file:s0
selinux_context=$(ls -Zd /system/etc/security/cacerts | awk '{print $1}')

if [ -n "$selinux_context" ] && [ "$selinux_context" != "?" ]; then
    chcon -R $selinux_context $MODDIR/system/etc/security/cacerts
else
    chcon -R $default_selinux_context $MODDIR/system/etc/security/cacerts
fi
