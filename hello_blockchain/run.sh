echo "hello_blockchain compile Start!"
aptos move compile --named-addresses hello_blockchain=0xa22db39c29d39404051540491440717beaf3c3edef3f06d30edff9bad68234a0
echo "hello_blockchain compile Successfully!"

echo "hello_blockchain test start!"
aptos move test --named-addresses hello_blockchain=0xa22db39c29d39404051540491440717beaf3c3edef3f06d30edff9bad68234a0
echo "hello_blockchain test Successfully!"

echo "hello_blockchain publish start!"
aptos move publish --named-addresses hello_blockchain=0xa22db39c29d39404051540491440717beaf3c3edef3f06d30edff9bad68234a0
echo "hello_blockchain publish Successfully!"