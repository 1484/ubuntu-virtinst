#!/bin/bash -x

for net in internal01 external01; do
  virsh net-destroy $net
  virsh net-undefine $net
done

virsh net-list --all
