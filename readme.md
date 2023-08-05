This website is powered by [Zola](https://www.getzola.org/) and hosted on [Cloudflare](https://www.cloudflare.com/). Theme used is [Hyde](https://www.getzola.org/themes/hyde/). To build site locally 
1) Clone this repository;
2) Clone [yeast repository](https://github.com/Alzymologist/yeast) anywhere and move all files to the `yeast` folder. This `yeast` folder should be inside the folder you choose for this repository;
3) Run `local_build.sh`:
```sh
./local_build.sh
```
You can also add  `/yeast/*` and `/yeast` to the `.gitignore` file to avoid tracking changes inside yeast component in this repository.