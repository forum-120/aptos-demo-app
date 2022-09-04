# Aptos-denom 

## Hello, Blockchain denom  

we use `aptos-core` as local dep, use subgitmodules 

## first step: init `aptos-core` 

```bash
git submodule init 
git submodule update

# or 
git submodule update --init --recursive  
```

submodule update: 
```bash
cd aptos-core/ 

git pull
```

## second step: 
```bash
cd hello_blockchain

zsh run.sh # in macos
bash run.sh # in linux 
```

## three step
```bash
npm run start # run front-end 
```