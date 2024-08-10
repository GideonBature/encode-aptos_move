module bene::homework7 {

    use std::signer;

    struct TokenAsset has key {
        value: u64,
    }

    public entry fun create_Asset(account: &signer, token_value: u64) acquires TokenAsset {

        if (!exists<TokenAsset>(signer::address_of(account))) {
            let tokenAsset = create(token_value);
            move_to(account, tokenAsset);
        } else {
            let tokenAsset = borrow_global_mut<TokenAsset>(signer::address_of(account));
            tokenAsset.value = token_value;
        }

    }

    fun create(token_value: u64): TokenAsset {
        let tokenAsset = TokenAsset { value: token_value };
        tokenAsset
    }

    public entry fun view_Asset(account: &signer): u64 acquires TokenAsset {
        let tokenAsset = borrow_global<TokenAsset>(signer::address_of(account));
        tokenAsset.value
    }
}