#[test_only]
module hello_world::hello_world_test {
    use std::vector;
    use std::unit_test;
    use aptos_std::debug;
    use std::signer;
    use hello_world::HelloWorld;


    fun get_account(): signer {
        vector::pop_back(&mut unit_test::create_signers_for_testing(1))
    }

    #[test(account = @0x1)]
    public entry fun test_hello_world() {

        let five = HelloWorld::gimme_five();
        debug::print<u8>(&five);
    }

    #[test(account = @0x1)]
    public entry fun test_integer() {

        // define empty variable, set value later
        let a: u8;
        a = 10;
        debug::print<u8>(&a);

        // define variable, set type
        let a: u64 = 11;
        debug::print<u64>(&a);

        // simple assignment with defined value type
        let a = 1123u128;
        debug::print<u128>(&a);

        // in function calls or expressions you can use ints as constant values
        if (a < 10) {};

        // or like this, with type
        if (a < 10u128) {}; // usually you don't need to specify type
    }


    #[test(account = @0x1)]
    public entry fun test_as_expr() {
        let a: u8 = 10;
        let b: u64 = 100;

        // we can only compare same size integers
        if (a == (b as u8)) abort 11; // this abort what mean? TODO
        if ((a as u64) == b) abort 11;
    }

    #[test(account = @0x1)]
    public  entry fun test_boolean() {
        // these are all the ways to do it
        let b: bool;
        b = true;
        debug::print<bool>(&b);
        let b: bool = true;
        debug::print<bool>(&b);
        let b = true;
        debug::print<bool>(&b);
        let b = false;
        debug::print<bool>(&b);
    }




    #[test(account = @0x1)]
    public entry fun test_address() {
        let addr: address; // type identifier

        // in this book I'll use {{sender}} notation;
        // always replace `{{sender}}` in examples with VM specific address!!!
        let account = get_account();
        debug::print<signer>(&account);
        addr = signer::address_of(&account);
        debug::print<address>(&addr);
    }

}
