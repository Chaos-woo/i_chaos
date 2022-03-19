# 一、i10n规则：
### 1.1 *.arb文件key值模板
```
模块{main、common、其他}_页面/抽象组件{_page/widget}_组件{appBar、option、list、tip、btn、label}_内容(用途){title、content、text_i}
```
例子：common_exception_page_appbar_title

### 1.2 I10n文件类S的使用
统一使用S.current.xxxx访问多语言资源，不使用BuildContext