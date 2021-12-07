# File based on "SomeOrdinaryGamers" scripts.
# Anything labeled with a * in the comment needs to be edited by you to work with your setup

# debugging
set -x

# load vars
source "/etc/libvirt/hooks/kvm.conf"

# kill the DM*
systemctl stop sddm.service

# Unbind VTconsoles*
echo 0 > /sys/class/vtconsole/vtcon0/bind
echo 0 > /sys/class/vtconsole/vtcon1/bind

# Unbind EFI-framebuffer
echo efi-framebuffer.0 > /sys/bus/platform/drivers/efi-framebuffer/unbind

# Avoid race condition*
sleep 5

# Unload Nvidia Drivers*
modprobe -r nvidia_uvm
modprobe -r i2c_nvidia_gpu
modprobe -r nvidia_drm
modprobe -r nvidia_modeset
#modprobe -r drm_kms_helper
modprobe -r nvidia
#modprobe -r drm

# Unbind GPU*
virsh nodedev-detach $VIRSH_GPU_VIDEO
virsh nodedev-detach $VIRSH_GPU_AUDIO
virsh nodedev-detach $VIRSH_GPU_USB
virsh nodedev-detach $VIRSH_GPU_SERIAL

# Isolate the CPU
systemctl set-property --runtime -- user.slice AllowedCPUs=0,6
systemctl set-property --runtime -- system.slice AllowedCPUs=0,6
systemctl set-property --runtime -- init.scope AllowedCPUs=0,6


# load vfio
modprobe vfio
modprobe vfio_pci
modprobe vfio_iommu_type1
