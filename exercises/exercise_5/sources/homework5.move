module basic_address::homework5 {
    struct Asset has drop {
        flag: u8,
        value: u64,
    }

    // add build_asset function
    fun build_asset(flag: u8, value: u64): Asset {
        assert!(flag == 0 || flag == 1, 17);

        assert!(value > 100, 17);

        create(value, flag)
    }

    fun create(value: u64, flag: u8): Asset {
        let asset = Asset {
            flag: flag,
            value: value,
        };
        asset
    }
}