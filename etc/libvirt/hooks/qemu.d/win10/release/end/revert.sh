# File based on "SomeOrdinaryGamers" scripts.
# Anything labeled with a * in the comment needs to be edited by you to work with your setup

# debugging
start -x

# load vars
source "/etc/libvirt/hooks/kvm.conf"

# Unload vfio
modprobe -r vfio
modprobe -r vfio_pci
modprobe -r vfio_iommu_type1

# Rebind GPU*
virsh nodedev-reattach $VIRSH_GPU_VIDEO
virsh nodedev-reattach $VIRSH_GPU_AUDIO
virsh nodedev-reattach $VIRSH_GPU_USB
virsh nodedev-reattach $VIRSH_GPU_SERIAL

# Rebind VTconsoles*
echo 1 > /sys/class/vtconsole/vtcon0/bind
echo 0 > /sys/class/vtconsole/vtcon1/bind

# Read Nvidia x config* (remove if on AMD)
nvidia-xconfig --query-gpu-info > /dev/null 2>&1

# Rebind EFI-framebuffer
echo efi-framebuffer.0 > /sys/bus/platform/drivers/efi-framebuffer/bind

# Reload Nvidia Drivers*
modprobe nvidia_uvm
modprobe i2c_nvidia_gpu
modprobe nvidia_drm
modprobe nvidia_modeset
modprobe drm_kms_helper
modprobe nvidia
modprobe drm

# Start the DM*
systemctl start sddm.service
