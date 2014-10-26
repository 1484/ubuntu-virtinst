#!/bin/bash

virsh destroy ubu01
virsh undefine ubu01
rm -fv $HOME/shoeisha-book/images/ubu01.img
resize
