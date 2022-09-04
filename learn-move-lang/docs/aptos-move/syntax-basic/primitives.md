# 基本类型

Move 的基本数据类型包括: 整型 (u8, u64, u128)、布尔型 boolean 和地址 address。

Move 不支持字符串和浮点数。

## 整型

整型包括 u8、u64 和 u128，我们通过下面的例子来理解整型：

```mvoe 
#[test(account = @0x1)]
public entry fun test_integer() {
    use aptos_std::debug;

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
```

## 运算符as

当需要比较值的大小或者当函数需要输入不同大小的整型参数时，你可以使用as运算符将一种整型转换成另外一种整型：

```move 
#[test(account = @0x1)]
public entry fun test_as_expr() {
    let a: u8 = 10;
    let b: u64 = 100;

    // we can only compare same size integers
    if (a == (b as u8)) abort 11; // this abort what mean? TODO
    if ((a as u64) == b) abort 11;
}
```
## 布尔型

布尔类型就像编程语言那样，包含false和true两个值。

```move 
#[test(account = @0x1)]
public  entry fun test_boolean() {
    use aptos_std::debug;

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
```

## 地址

地址是区块链中交易发送者的标识符，转账和导入模块这些基本操作都离不开地址。

```mvoe 
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

```
