module bene::h4 {
    struct MyData has key, store {
        value: u8,
    }

    fun init_module(sender: &signer) {
        let my_data = MyData { value: 25 };
        move_to(sender, my_data);
    }
}