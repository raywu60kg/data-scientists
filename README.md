# Summary
See the [Docker hub](https://hub.docker.com/repository/docker/raywu60kg/data-scientists).
This is a simple docker image for data scientists for sometimes we need to work remotely.

# Environment
- Environment
    - zsh theme from [caiogondim/bullet-train.zsh](https://github.com/caiogondim/bullet-train.zsh)
    - some vim settings from my friend [jneo8/vim_settings](https://github.com/jneo8/vim_settings)
- Python
    - TensorFlow or Pytorch
    - sklearn
    - pandas
    - tqdm 
    - jupyter notebook
    - jupyter notebook theme ocean16
    - jupyter autopep8 from [kenkoooo/jupyter-autopep8](https://github.com/kenkoooo/jupyter-autopep8)

# Usage
### Jupyter note book

if we want to use jupyter notebook, we can just go to the direaction we want and 
```
docker run --rm -it -v $(pwd):/usr/src/app -p 8888:8888 raywu60kg/data-scientists activateJupyter  
```
The jupyter notebook will be activated on port:8888. **The password is `0000`** and our file will in `/app`
### Exec the container
if we want to go in the container,  we can just go to the direaction we want and
```
docker run --rm -it -v $(pwd):/usr/src/app -p 8888:8888 raywu60kg/data-scientists zsh
```
and we can turn on jupyter anytime we want by `activateJupyter`

# Note 
1. When the first time we use vim we need to 
```
:PlugInstall
```
to install vim plugins.


2. When we use zsh and vim, some icons might not be shown. we might need to install powerline by 
```
sudo apt-get install powerline
```
on your local machine.

3. Strongly recommend to use the following Nbextension: `Autopep8`, `Hinterland` and `Table of Contents(2)`