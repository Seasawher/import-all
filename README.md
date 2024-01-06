# import-all

This is not my original. see [yatima](https://github.com/lurk-lab/yatima/blob/main/lakefile.lean)

* Almost all of this script is taken from <https://github.com/lurk-lab/yatima/blob/main/lakefile.lean>.
* <https://github.com/lurk-lab/yatima> is licensed under the MIT license.

## how to use this

Add this repository to your `lakefile`:

```lean
require mdgen from git
  "https://github.com/Seasawher/import-all" @ "main"
```

Don't forget to run `lake update mdgen` after editing the `lakefile`.

Now you can run `lake exe import_all <input_dir>` and `lake exe import_check <input_dir>`.