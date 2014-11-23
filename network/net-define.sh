#!/bin/bash


for net in external01 internal01; do
  virsh net-define ${net}.xml
  virsh net-start ${net}
  virsh net-autostart ${net}
done

virsh net-list --all
