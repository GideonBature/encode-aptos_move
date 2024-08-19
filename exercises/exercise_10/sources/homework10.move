module addr::homework10 {

    use aptos_framework::object;
    use aptos_framework::event;
    use std::signer;
    use std::string::{String};

    #[event]
    struct ExampleObjectCreatedEvent has drop, store {
        my_object: address,
    }

    #[resource_group_member(group = aptos_framework::object::ObjectGroup)]
    struct ExampleObject has key {
        name: String,
        balance: u64,
    }

    // Declare a module-level event
    // public fun emit_example_object_created_event(my_object: address) {
    //     event::emit<ExampleObjectCreatedEvent>(ExampleObjectCreatedEvent { my_object });
    // }
    const NAME: vector<u8> = b"ObjectNumber10";

    public entry fun create_example_object(user: &signer, name: String, balance: u64) {
        let caller_address = signer::address_of(user);
    
        let constructor_ref = object::create_named_object(user, NAME);

        let object_signer = object::generate_signer(&constructor_ref);

        move_to(&object_signer, ExampleObject {
            name,
            balance,
        });

        event::emit<ExampleObjectCreatedEvent>(ExampleObjectCreatedEvent {
            my_object: object::address_from_constructor_ref(&constructor_ref),
        });
    }

    #[view]
    public fun view_object_address(user: &signer): address {
        let caller_address = signer::address_of(user);
        let object_address = object::create_object_address(&caller_address, NAME);
        object_address
    }

}