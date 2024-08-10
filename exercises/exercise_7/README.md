# Homework 7
## Interact with your contract

1. Set up your CLI environment as you did in [exercise 4](https://github.com/GideonBature/encode-aptos_move/tree/main/exercises/exercise_4).

2. Send some APT to one of your colleagues.

3. List the modules owned by your account, if you don't have any follow [exercise 6](https://github.com/GideonBature/encode-aptos_move/tree/main/exercises/exercise_6) to deploy a module.

    ```bash
    aptos account list --query resources --account default
    ```

4. Add a view function to your module which will return the value field of the TokenAsset resource.

5. Change the create function.
    
    1. Add a numeric argument token_value.
    
    2. Use this to set the initial value field in the TokenAsset struct.

6. Interact with this module using the CLI to.
    
    1. Create a Token Asset with value 42.
        ```bash
        aptos move run --function-id <the-address-you-published-to>::<module_name>::<function_name> --args u64:42
        ```
    
    2. Call the view function you created.
        ```bash
        aptos move run --function-id <the-address-you-published-to>::<module_name>::<function_name> --args address:<the-address-you-published-to>
        ```
