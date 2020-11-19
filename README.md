# dockerfile-pandoc-ja

Alpine based Pandoc for Japanese.

## Usage

### Prepare Default file

Prepare the Default file first.
Copy xxx-defaults.yaml with any name.
Edit the copied file.

The options that need to be edited are:

- input-files
  - Enumerate the input files. If not set, specify it in the command line option.

- outputfile
  - Set the output file. If not set, specify it in the command line option.

- template
  - Sets the template used for HTML output. Set only when outputting in HTML format.

- metadata
  - You can replace keywords such as titles, figures, and tables.

### Build docker image

```bash
docker build -t [image-name] .
```

### Run docker image

The basic execution method is as follows

```bash
docker run --rm --volume "$(pwd):/data" [image-name] -d [Default file]
```

When specifying the file name, it is as follows

```bash
docker run --rm --volume "$(pwd):/data" [image-name] [input-file] -o [output-file] -d [Default file]
```

## Reference Dockerfile

- [pandoc/dockerfiles](https://github.com/pandoc/dockerfiles)

## Reference

- [Pandoc+Dockerでドキュメント作成環境を整備する - 日々是好日](https://kcpoipoi.hatenablog.com/entry/2020/07/27/120438)
- [LuaTeXで原ノ味フォントを使う - Qiita](https://qiita.com/trueroad/items/5030c9460da71065a721)