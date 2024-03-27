# import-all

This is not my original. see [yatima](https://github.com/lurk-lab/yatima/blob/main/lakefile.lean)

* Almost all of this script is taken from <https://github.com/lurk-lab/yatima/blob/main/lakefile.lean>.
* <https://github.com/lurk-lab/yatima> is licensed under the MIT license.

## how to use this

Add this repository to your `lakefile`:

```lean
require «import-all» from git
  "https://github.com/Seasawher/import-all" @ "main"
```

Don't forget to run `lake update import-all` after editing the `lakefile`.

Now you can run `lake exe import_all <input_dir>` and `lake exe import_check <input_dir>`.

* `import_all` auto generate `import` statements for lean files in `<input_dir>`

* `import_check` is mainly for CI. This command checks to see if the lean files in `<input_dir>` have been imported correctly.

## You may not need to use this repository

What are you going to use this script for? If you want to ensure that all files are built every time you run `lake build`, this repository is not necessary. Instead, add the following settings to your `lakefile`. (replace `YourProject` with your project directory name 😃)

```lean
@[default_target]
lean_lib «YourProject» where
  globs := #[.submodules `YourProject]
```
