# kvm-passthrough

## What is this repo?

This is my backup of qmeu hooks for running windows 10 under kvm with single-GPU passthrough. All the scripts are based off of [SomeOrdinaryGamers video](https://www.youtube.com/watch?v=BUSrdUoedTo) on setting this up.

## Will these files work for everyone?

**NO!!** This is sort of a template repo and a backup of scripts that work for me. I'll put below what you need to edit in order to get yours working on your machine.

This repo was tested with an AMD Ryzen 5 5600x and an EVGA RTX 2080 Super Black running Manjaro KDE 21.04

## Is there anything that fully doesn't work?

Sorta. My restart scripts did not properly reload my drivers so until I find a fix, I have it set to restart my entire system when the VM is killed. I recommend removing that line if you know how to properly fix it.

## What needs to be edited?

In each of the scripts I labeled each area with a * to mark what needs to be modified.

# Guide

My personal guide of this can be found [here](https://guides.46620.moe/machine/linux/1gpu_pass/)
