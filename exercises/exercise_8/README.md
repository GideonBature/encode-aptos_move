# Homework 8
## Build the boilerplate UI with `Create-Aptos_Dapp`. See [Docs](https://aptos.dev/en/build/create-aptos-dapp) In a terminal

1. Create a directory to hold your dApp, in that directory run:
    ```bash
    npx create-aptos-dapp@latest
    ```
    When prompted chose boilerplate template


2. Once the project has been created, run the project with:
    ```bash
    npm run dev
    ```
3. On the resulting front end connect your wallet to see details about your account.

4. Go through the components, and entry functions and view functions, make sure you understand what they are doing.

### Fix

* Error:

```bash
... error while loading shared libraries: libssl.so.1.1: cannot open shared object file: No such file or directory
```

* Fix:
```bash
wget http://nz2.archive.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.1f-1ubuntu2_amd64.deb
```
```bash
sudo dpkg -i libssl1.1_1.1.1f-1ubuntu2_amd64.deb
```
