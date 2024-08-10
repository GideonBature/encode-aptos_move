# Homework 5
## Write a simple module

1. Take this ```module``` and this ```config file``` and complete the code and config according to the following:
    * Module:
    ```move
    // homework5.move
    module basic_address::homework5 {
        struct Asset has drop {
            // add code here
        }

        //add build_asset function

        fun create(value : u64, flag : u8) : Asset {
            // add code here
        }
    }
    ```
    * Config File:
    ```config
    // move.toml
    [package]
    name = 'Homework5'
    version = '1.0.0'
    
    [addresses]
    basic_address =  <ADD YOUR ADDRESS HERE>
    
    [dependencies.AptosFramework]
    git = 'https://github.com/aptos-labs/aptos-core.git'
    rev = 'mainnet'
    subdir = 'aptos-move/framework/aptos-framework'
    ```
    

2. In the config file set the basic_address to be your wallet address

3. In the module The Asset struct should have 2 fields:
    1. an unsigned 8 bit integer named flag.
    2. an unsigned 64 bit integer called value.

4. The function create has 2 arguments.
    1. An unsigned 8 bit integer named flag.
    2. An unsigned 64 bit integer called value.

5. The create function should create an instance of the asset struct using the arguments to populate the fields.

6. The create function should return an instance of the asset struct.

7. The create function should not be visible to other modules.

8. The build asset function should call the the create function, and only allow the creation of assets where the value is greater than 100, and the flag is 0 or 1.

9. The function should throw an error if those requirements are not met, in either case giving an error code of 17.

10. You do not need to do anything with the asset that was created.

**Hint:** you can use the assert! macro
