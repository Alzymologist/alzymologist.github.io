This repository contains site-generation part of the [Zymologia](https://www.zymologia.fi/) website. It is powered by Rust, [Zola](https://www.getzola.org/) and is hosted on [Cloudflare](https://www.cloudflare.com/). The theme in use is [Hyde](https://www.getzola.org/themes/hyde/). This repository should be used together with [yeast component](https://github.com/Alzymologist/yeast) (feature-2 branch), which processes data and populates website pages.   
   
To build website locally:   

0) Install stable Rust, Zola and Graphwiz;    
1) Clone this repository;   
2) Clone the [yeast repository](https://github.com/Alzymologist/yeast) (feature-2 branch) to the `yeast_component` folder inside this repository. Easy way to do this is to clone [yeast repository](https://github.com/Alzymologist/yeast) anywhere on your computer and then move its contents to the `yeast_component` folder.   
3) Run `local_build.sh` to execute build:   
```sh
./local_build.sh
```
You can also add `/yeast_component/*` and `/yeast_component` to the `.gitignore` file to avoid tracking changes inside yeast component. 


# OPTIONAL

Build script for VsCodium, which launches a component on Rust (processes data and populates website pages) and raises a local development server using Zola. If the build script is already running but the Zola server has not yet been launched, then relaunching the script will have no effect. If the Zola server is already running, then relaunching the script will stop the server, and another run will restart the build. The contents of the tasks.json file for VSCodium:   
```
{
  "version": "2.0.0",
  "tasks": [
    {
      "label": "local build",
      "type": "shell",
      "command": "./local_build.sh",
      "group": {
        "kind": "build",
      }
    },
    {
      "label": "stop zola",
      "type": "shell",
      "command": "pkill -f 'zola.*serve' || true",
      "presentation": {
        "reveal": "never"
      },
      "problemMatcher": []
    },
    {
      "label": "stop zola and local build",
      "dependsOn": ["stop zola", "local build"],
      "group": {
        "kind": "build",
        "isDefault": true
      },
      "problemMatcher": []
    }
  ]
}

```
