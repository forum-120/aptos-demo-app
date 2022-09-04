# 快速入门
与任何编程语言一样，Move 应用程序也需要一组适当的工具来编译、运行和调试。
由于 Move 语言是为区块链创建、并且仅在区块链中使用，因此在链下运行程序不是一件容易的事，因为每个应用都需要一个编辑环境、账户处理和编译-发布系统。

这里我使用Clion作为开发move 合约，使用了Clion上move语言的插件。
该扩展可以满足开发者对开发环境的基本需求。它的功能除了程序执行外还包括 Move 语法高亮显示，
可以更好的帮助开发者在发布之前调试应用程序。开发者只需专注于 Move 语言本身，而不必为客户端（CLI）苦苦挣扎。

## 安装 Move IDE
需要安装下面的软件:
- [Clion](https://www.jetbrains.com/clion/) 
- [intellij-move](https://github.com/pontem-network/intellij-move) 

## 环境设置
`aptos move init` 提供了单一的方法来组织目录结构。执行命令之后，并在 `Clion` 中打开它，就可以得到如下目录结构：

```bash
modules/   - directory for our modules
Move.toml  - Move Smart contracts config metadata 
```

## 第一个 Move 应用
开发者可以在测试环境中运行程序。让我们通过一个例子来了解其工作原理：实现 gimme_five() 功能并运行它。

### 创建模块
在项目的目录 modules/ 内创建一个新文件 hello_world.move。这里还添加了一个测试

```move
// modules/hello_world.move
module hello_world::HelloWorld {
    public fun gimme_five(): u8 {
        5
    }

    #[test(account = @0x1)]
    public entry fun test_hello_world() {
        use aptos_std::debug;

        let five = gimme_five();
        debug::print<u8>(&five);
    }
}
```
 
这里我们依赖的是aptosframework的本地依赖，因为此包仍然处于开发状态。

```toml 
[package]
name = 'hello_world'
version = '1.0.0'

[addresses] # this section must be addresses
hello_world = "_"

[dependencies]
# local AptosFramework dep
AptosFramework = { local = "../../aptos-core/aptos-move/framework/aptos-framework" }
```

## compile && test

```bash 
# for compile
aptos move compile --named-addresses hello_world=0xa22db39c29d39404051540491440717beaf3c3edef3f06d30edff9bad68234a0

# for test 
aptos move test --named-addresses hello_world=0xa22db39c29d39404051540491440717beaf3c3edef3f06d30edff9bad68234a0

```