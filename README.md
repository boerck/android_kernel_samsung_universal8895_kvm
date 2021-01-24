Samsung Galaxy S8 Exynos (dreamlte) KVM enabled test kernel
===========
This kernel is KVM enabled kernel for my test<br/>
You can build and use if you want


### How to build
1. Use `git submodule update --init --recursive` in the repository to import Android Image Kitchen.
2. Unpack original Galaxy S8 boot.img with `AIK-Linux/unpackimg.sh`. It will be extracted to `AIK-Linux/split_img/`.
3. Use `bash build_kernel.sh` to build kernel.
4. New boot.img will be created in `AIK_Linux/`
