# Aptos-denom 

## Pre
- install this wallet: https://petra.app/
- create a account 
- faucte some apt token

you will look at petra wallet about this account, public key, private key and account. 
you need update hello_blockchain/.aptos/config.toml this fileds. and update run.sh hello_blockchain={address}, to you account.

## Hello, Blockchain denom  

we use `aptos-core` as local dep, use subgitmodules 

## first step: init `aptos-core` 

```bash
git submodule init 
git submodule update

git switch devnet # switch devnet branch

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
