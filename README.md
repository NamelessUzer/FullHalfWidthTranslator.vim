# FullHalfWidthTranslator

FullHalfWidthTranslator 是一个 Vim 插件，用于在全角字符和半角字符之间进行转换。这个插件支持将光标下的单词或者选定的文本进行全角到半角的转换、半角到全角的转换，以及反转全半角。

## 功能

- **全角转半角**: 将选定的全角字符转换为对应的半角字符。
- **半角转全角**: 将选定的半角字符转换为对应的全角字符。
- **反转全半角符号**: 对于选定的文本，将其宽度类型调换为相反的宽度类型。

## 安装

可以通过您喜欢的 Vim 包管理器安装 FullHalfWidthTranslator。下面是使用 Vim-Plug 的示例：

```
Plug 'NamelessUzer/FullHalfWidthTranslator'
```

安装插件后，运行 `:PlugInstall`。

### 自定义键绑定

将以下配置添加到您的 `.vimrc` 或 `init.vim` 文件中设置。
当然，您可以根据个人喜好使用不同的键绑定。

```VimL
" 设置操作符映射键
" Map converting to half-width
nnoremap gwh <Plug>(FullWidth2HalfWidth)
vnoremap gwh <Plug>(FullWidth2HalfWidth)

" Map converting to full-width
nnoremap gwf <Plug>(HalfWidth2FullWidth)
vnoremap gwf <Plug>(HalfWidth2FullWidth)

" Map toggling width
nnoremap gwt <Plug>(ToggleFullWidthHalfWidth)
vnoremap gwt <Plug>(ToggleFullWidthHalfWidth)

" 定义映射键
" 将指定行数范围（缺省: 当前行）的字符转换为半角
nnoremap gwhh <Plug>(Translate2HalfWidth)
" 将指定行数范围（缺省: 当前行）的字符转换为全角
nnoremap gwff <Plug>(Translate2FullWidth)
" 将指定行数范围（缺省: 当前行）的字符的全半角对调
nnoremap gwtt <Plug>(Translate2ToggleWidth)
```

## 使用方法

FullHalfWidthTranslator 通过操作符映射来工作。以推荐配置为例，当前支持的操作有：

- **全角转半角**: `gwh`
- **半角转全角**: `gwf`
- **对调全半角符号**: `gwt`

- 普通模式下，将 `gwh`、`gwf` 和 `gwt` 分别映射为全角转半角、半角转全角和自动切换操作。
  例如，要将光标下的单词从半角转换为全角，只需按 `gwfiw`。
  要将光标下的字符从全角转换为半角，只需按 `gwhl`。
  要将光标所在行的字符从全角转换为半角，只需按 `gwhh`。
- 可视模式下，相同的键绑定对选定的文本进行操作。选择一段文本后，按 `gwh` 将其从全角转换为半角。

## 贡献

欢迎通过 GitHub 提交问题或者拉取请求来贡献这个项目。

## 许可证

GPL v3
