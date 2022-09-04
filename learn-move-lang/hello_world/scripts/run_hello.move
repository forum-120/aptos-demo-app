script {
    use hello_world::HelloWorld;
    use aptos_std::debug;

    fun main() {
        let five = HelloWorld::gimme_five();

        debug::print<u8>(&five);
    }
}