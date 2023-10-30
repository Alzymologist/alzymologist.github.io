This repository contains site-generation part of the [Zymologia](https://www.zymologia.fi/) website. It is powered by Rust, [Zola](https://www.getzola.org/) and is hosted on [Cloudflare](https://www.cloudflare.com/). The theme in use is [Hyde](https://www.getzola.org/themes/hyde/). This repository should be used together with [yeast component](https://github.com/Alzymologist/yeast), which processes data and populates website pages.   
   
To build website locally:   
0) Install stable Rust, Zola and Graphwiz;
1) Clone this repository;   
2) Clone the [yeast repository](https://github.com/Alzymologist/yeast) to the `yeast_component` folder inside this repository. Easy way to do this is to clone [yeast repository](https://github.com/Alzymologist/yeast) anywhere on your computer and then move its contents to the `yeast_component` folder.   
3) Run `local_build.sh` to execute build:   
```sh
./local_build.sh
```
You can also add `/yeast_component/*` and `/yeast_component` to the `.gitignore` file to avoid tracking changes inside yeast component.  