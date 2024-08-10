module bene::homework6 {
    struct TokenAsset has key {
        value: u64,
    }

    public entry fun create_Asset(account: &signer) {
        let tokenAsset = create();

        move_to(account, tokenAsset);
    }

    fun create(): TokenAsset {
        let tokenAsset = TokenAsset { value: 0 };
        tokenAsset
    }
}