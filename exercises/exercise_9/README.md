# Homework 9
## Working with Objects

1. Complete this `gist` to create a normal object.
    ```move
    module my_addr::h9 {
        use aptos_framework::object;
        use std::signer;
        use std::string::{String}; 

        #[resource_group_member(group = aptos_framework::object::ObjectGroup)]
        struct ExampleObject has key {

        }

        public entry fun create_example_object(user: &signer, name : String, balance: u64) {
        
        }
    }
    ```

2. Create an event which has one field:
    ```move
    my_object: address,
    ```

3. The resource should contain the following fields:
    ```move
    name: String,
    balance : u64,
    ```
4. The `create_example_object` function should:
    1. Create a normal object
    2. Create a signer for that object
    3. Move the resource to the object you created
    4. Use the constructor_ref to get the address of the object
    5. Emit the address using the event you defined.