COMMON_FOLDER := device/amazon/hdx-common

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Get non-open-source specific aspects
$(call inherit-product-if-exists, vendor/amazon/hdx-common/hdx-common-vendor.mk)

# AOSP overlay
DEVICE_PACKAGE_OVERLAYS += $(COMMON_FOLDER)/overlay-common

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi xxhdpi
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

# Ramdisk
PRODUCT_PACKAGES += \
	fstab.qcom \
	init.qcom.class_core.sh \
	init.qcom.class_main.sh \
	init.qcom.early_boot.sh \
	init.qcom.rc \
	init.qcom.ril.sh \
	init.qcom.sensor.sh \
	init.qcom.sh \
	init.qcom.syspart_fixup.sh \
	init.qcom.usb.rc \
	init.qcom.usb.sh \
	init.target.rc \
	init.trace.rc \
	ueventd.qcom.rc

# Safestrap compatibility
PRODUCT_COPY_FILES += \
	$(COMMON_FOLDER)/rootdir/etc/fstab.qcom:system/etc/rootfs/fstab.qcom \
	$(COMMON_FOLDER)/rootdir/ss/init.rc:system/etc/rootfs/init.rc \
	$(COMMON_FOLDER)/rootdir/ss/init.cm.rc:system/etc/rootfs/init.cm.rc \
	$(COMMON_FOLDER)/rootdir/ss/init.environ.rc:system/etc/rootfs/init.environ.rc \
	$(COMMON_FOLDER)/rootdir/ss/init.superuser.rc:system/etc/rootfs/init.superuser.rc

# Recovery
PRODUCT_COPY_FILES += \
	$(COMMON_FOLDER)/twrp.fstab:recovery/root/etc/twrp.fstab

# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.r_submix.default \
    audio.usb.default \
    libaudio-resampler 

# Charger
PRODUCT_PACKAGES += \
    charger \
    charger_res_images

# Filesystem management tools
PRODUCT_PACKAGES += \
    make_ext4fs \
    e2fsck \
    setup_fs

PRODUCT_PACKAGES += \
 	libxml2 \
	libnetcmdiface

# Graphics
PRODUCT_PACKAGES += \
    copybit.msm8974 \
    gralloc.msm8974 \
    hwcomposer.msm8974 \
    memtrack.msm8974 \
    liboverlay \
    libqdutils \
    libqservice \
    libqdMetaData

# GPS
PRODUCT_PACKAGES += \
    gps.msm8974

# Lights
PRODUCT_PACKAGES += \
    lights.msm8974

# Media
PRODUCT_PACKAGES += \
    libc2dcolorconvert \
    libdivxdrmdecrypt \
    libdashplayer \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxCore \
    libOmxEvrcEnc \
    libOmxQcelp13Enc \
    libOmxVdec \
    libOmxVdecHevc \
    libOmxVenc \
    libstagefrighthw \
    qcmediaplayer

# Power
PRODUCT_PACKAGES += \
    power.msm8974

# QRNGD
#PRODUCT_PACKAGES += \
#    qrngd \
#    qrngp

# Keystore
#PRODUCT_PACKAGES += \
#    keystore.msm8974

# USB
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

PRODUCT_PACKAGES += \
    wpa_supplicant_overlay.conf \
    p2p_supplicant_overlay.conf \
    hostapd_default.conf \
    hostapd.accept \
    hostapd.deny

PRODUCT_BOOT_JARS += qcmediaplayer



# Wifi
#PRODUCT_PACKAGES += \
#    libnetcmdiface \
#    macloader \
#    crda \
#    regulatory.bin \
#    linville.key.pub.pem

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp

# QC Perf
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.extension_library=/vendor/lib/libqc-opt.so

# Common build.props
PRODUCT_PROPERTY_OVERRIDES += \
    ro.chipname=msm8974 \
    ro.sf.lcd_density=320 \
    ro.opengles.version=131072 \
    persist.timed.enable=true \
    keyguard.no_require_sim=true \
    lockscreen.rot_override=true

# Radio props
PRODUCT_PROPERTY_OVERRIDES += \
    rild.libpath=/system/lib/libril-lab126qmi.so \
    ril.subscription.types=NV,RUIM \
    ro.use_data_netmgrd=true \
    persist.data.netmgrd.qos.enable=true \
    persist.rild.nitz_plmn= \
    persist.rild.nitz_long_ons_0= \
    persist.rild.nitz_long_ons_1= \
    persist.rild.nitz_long_ons_2= \
    persist.rild.nitz_long_ons_3= \
    persist.rild.nitz_short_ons_0= \
    persist.rild.nitz_short_ons_1= \
    persist.rild.nitz_short_ons_2= \
    persist.rild.nitz_short_ons_3= \
    DEVICE_PROVISIONED=1 \
    ro.telephony.default_network=9 \
    ro.ril.usb.port.serial=ttyUSB \
    ro.ril.usb.port.qmi=qmi_usb \
    ro.ril.usb.port.rmnet=rmnet_usb

PRODUCT_PROPERTY_OVERRIDES += \
    debug.sf.hw=1 \
    debug.egl.hw=1 \
    persist.hwc.mdpcomp.enable=true \
    debug.mdpcomp.logs=0 \
    debug.composition.type=c2d

PRODUCT_PROPERTY_OVERRIDES += \
	ro.hdmi.enable=true \
	tunnel.decode=true \
	tunnel.audiovideo.decode=true \
	tunnel.multiple=true \
	lpa.decode=false \
	lpa.use-stagefright=true \
	persist.speaker.prot.enable=false \
	media.stagefright.enable-player=true \
	media.stagefright.enable-http=true \
	media.stagefright.enable-aac=true \
	media.stagefright.enable-qcp=true \
	media.stagefright.enable-fma2dp=true \
	media.stagefright.enable-scan=true \
	mmp.enable.3g2=true \
	media.aac_51_output_enabled=true

PRODUCT_PROPERTY_OVERRIDES += \
	ro.qcom.ad=1 \
	ro.qcom.ad.calib.data=/system/etc/ad_calib.cfg

PRODUCT_PROPERTY_OVERRIDES += \
	persist.sys.recovery.batt_level=25 \
	dmid=1932882026

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

# We have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# call dalvik heap config
$(call inherit-product, frameworks/native/build/phone-xxhdpi-2048-dalvik-heap.mk)

# call hwui memory config
$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-2048-hwui-memory.mk)

# links !
#	ln -s /system/etc/wifi/wpa_supplicant_ath6kl.conf /system/etc/wifi/wpa_supplicant.conf
#	ln -s /data/misc/wifi/WCNSS_qcom_cfg.ini /system/etc/firmware/wlan/prima/WCNSS_qcom_cfg.ini
#	ln -s /persist/WCNSS_qcom_wlan_nv.bin /system/etc/firmware/wlan/prima/WCNSS_qcom_wlan_nv.bin
#	ln -s /system/etc/firmware/ath6k/AR6004/hw1.3/bdata.bin_usb /system/etc/firmware/ath6k/AR6004/hw1.3/bdata.bin
#	ln -s /system/etc/firmware/ath6k/AR6004/hw1.3/fw.ram.bin_usb /system/etc/firmware/ath6k/AR6004/hw1.3/fw.ram.bin
#	ln -s /system/etc/firmware/ath6k/AR6004/hw3.0/boardData_Thor_FCC.bin /system/etc/firmware/ath6k/AR6004/hw3.0/bdata.bin
###############################
#	ln -s /data/misc/audio/mbhc.bin /system/etc/firmware/wcd9320/wcd9320_mbhc.bin
#	ln -s /data/misc/audio/wcd9320_anc.bin /system/etc/firmware/wcd9320/wcd9320_anc.bin; \
#	ln -s /data/misc/audio/wcd9320_mad_audio.bin /system/etc/firmware/wcd9320/wcd9320_mad_audio.bin; \

