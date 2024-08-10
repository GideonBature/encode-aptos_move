# Homework 6
## Move an Asset

1. Take the skeleton code from this gist:
    ```move
    // homework6.move
    module  // add module details {

        struct TokenAsset {
            // add the key ability
            //add value field
        }

        public entry fun create_Asset(account : &signer) {
            // create a TokenAsset 
            // move the TokenAsset to the account address 
        }

        fun create() : TokenAsset {
            // return a Token Asset with 0 value
        }

    }
    ```

2. Fill in the module details

3. Set up the struct so that it has
    
    1. The key ability
    
    2. A value field of appropriate numeric type

4. Fill in the create function so that it creates and returns a TokenAsset with zero value.

5. In the create_Asset function call the create function to create the asset and then move the asset so that it is owned by the account address

6. Deploy to Devnet, you can use the block explorer to find your module and run the create_Asset function.
