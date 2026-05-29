<!-- source: test\bundle_manager\build.py -->

# `test\bundle_manager\build.py`

---

## module function:

该模块是一个自动化构建脚本，专门用于测试套件的构建和部署，在项目中扮演测试流程自动化角色，负责将测试项目打包、签名并生成可执行的测试产物。它提供的核心能力包括环境配置、项目构建、代码签名、文件复制及JSON元数据生成，通过集成DevEcoProject和TestSuiteBuilder等类来管理HarmonyOS应用的构建流程。关键实现方式是通过加载环境变量动态设置工具路径，然后依次执行构建、签名操作，最后将签名后的HAP文件复制到目标目录并输出JSON格式的测试套件描述。

## module usage example:

```python
# source: test\bundle_manager\build.py
```

# func `build()`

## function:

该函数的核心功能是构建一个测试项目，以调试模式编译并签名，然后将生成的 HAP 文件复制到产品目录，并更新测试套件配置。处理逻辑包括初始化项目路径、执行构建和签名操作、复制文件以及输出 JSON 配置。

该函数没有输入参数，也不返回任何值。它通过执行一系列操作来完成构建和配置任务，主要依赖内部对象和文件操作。

在项目中，这个函数常用于自动化测试或持续集成流程，用于生成可测试的 HAP 文件并准备测试环境，便于后续的测试执行或部署。

## usage example:

```python
def build():
    testsuite_dir_path = os.path.join(os.path.dirname(os.path.abspath(__file__)))
    tb = TestSuiteBuilder(testsuite_dir_path=testsuite_dir_path)
    test_project = DevecoProject(os.path.join(tb.testsuite_dir_path, 'test'))
    test_bundle = Bundle(test_project)
    test_project.build(build_mode='debug')
    test_project.do_signing()
    copy_file(test_project.get_signed_hap_file_path(), os.path.join(tb.product_dir_path, 'entry.hap'))
    tb.test_file_name.append(os.path.join(tb.product_dir_path, 'entry.hap'))
    tb.dump_json(project_type='pure')
```
