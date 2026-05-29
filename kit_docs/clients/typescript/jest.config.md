<!-- source: clients\typescript\jest.config.js -->

# `clients\typescript\jest.config.js`

---

## function:

该配置文件控制了TypeScript项目中单元测试的框架和环境设置。它指定了使用`ts-jest`预设来处理TypeScript代码，并在`node`环境中运行测试；配置项定义了测试文件的根目录、匹配规则以及代码覆盖率的收集范围。这直接影响测试能否正确执行TypeScript代码以及测试覆盖率报告的准确性。

## declaration:

```js
module.exports = {
  preset: "ts-jest",
  testEnvironment: "node",
  roots: ["<rootDir>/src"],
  testMatch: ["**/__tests__/**/*.test.ts"],
  collectCoverageFrom: ["src/**/*.ts", "!src/**/*.d.ts", "!src/__tests__/**"],
};
```
