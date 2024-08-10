# Exercise 4

## Using the Move CLI

### Creating a simple project

1. Follow the instructions from the lesson to install the Aptos CLI

2. Create a directory called h4 and within that use the CLI to create a project:
    ```bash
    aptos move init --name h4
    ```
3. Set up your environment within that directory by running:
    ```bash
    aptos init
    ```
    This will take you through setting up an account, choose the default network devnet.

4. You can get extra funds from the faucet with:
    ```bash
    aptos account fund-with-faucet --account default
    ```
5. See what resources and balance is associated with your account:
    ```bash
    aptos account list --query balance --account default
    ```
    ```bash
    aptos account list --query resources --account default
    ```

### Compiling a module
1. Create a simple module in file h4.move which should be in the sources directory. You can use the code from this gist (Change the module address to be your account address):
    ```move
    module 0xcafe::h4 {
        struct MyData has key, store {
            value: u8
        }

        fun init_module(sender: &signer) {
            // here we can initialise the data
        }
    }
    ```

2. Compile your code with:
    ```bash
    aptos move compile
    ```
3. Deploy your code to devnet with:
    ```bash
    aptos move publish
    ```
4. Find the transaction on the block explorer, and recheck the resources and modules associated with your account.
