export SKIP_ABI_CHECKS=true
export SELINUX_IGNORE_NEVERALLOWS=true
export TEMPORARY_DISABLE_PATH_RESTRICTIONS=true

# Clone HALs from AOSP-11 to fix wfd
rm -rf hardware/qcom-caf/msm8998/display
rm -rf hardware/qcom-caf/msm8998/media
rm -rf hardware/qcom-caf/msm8998/audio

git clone -b 11-caf-msm8998 https://github.com/bananadroid/android_hardware_qcom_display.git hardware/qcom-caf/msm8998/display
git clone -b 11-caf-msm8998 https://github.com/bananadroid/android_hardware_qcom_media.git hardware/qcom-caf/msm8998/media
git clone -b 11-caf-msm8998 https://github.com/bananadroid/android_hardware_qcom_audio.git hardware/qcom-caf/msm8998/audio
