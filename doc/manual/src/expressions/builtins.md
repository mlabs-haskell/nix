# Built-in Functions

This section lists the functions built into the Nix expression
evaluator. (The built-in function `derivation` is discussed above.)
Some built-ins, such as `derivation`, are always in scope of every Nix
expression; you can just access them right away. But to prevent
polluting the namespace too much, most built-ins are not in
scope. Instead, you can access them through the `builtins` built-in
value, which is a set that contains all built-in functions and values.
For instance, `derivation` is also available as `builtins.derivation`.

<dl>
  <dt><code>derivation <var>attrs</var></code>;
      <code>builtins.derivation <var>attrs</var></code></dt>
  <dd><p><var>derivation</var> is described in
         <a href="derivations.md">its own section</a>.</p></dd>
<dt id="builtins-abort"><a href="#builtins-abort"><code>abort <var>s</var></code></a></dt><dd>

Abort Nix expression evaluation and print the error message *s*.

</dd><dt id="builtins-add"><a href="#builtins-add"><code>add <var>e1</var> <var>e2</var></code></a></dt><dd>

Return the sum of the numbers *e1* and *e2*.

</dd><dt id="builtins-all"><a href="#builtins-all"><code>all <var>pred</var> <var>list</var></code></a></dt><dd>

Return `true` if the function *pred* returns `true` for all elements
of *list*, and `false` otherwise.

</dd><dt id="builtins-any"><a href="#builtins-any"><code>any <var>pred</var> <var>list</var></code></a></dt><dd>

Return `true` if the function *pred* returns `true` for at least one
element of *list*, and `false` otherwise.

</dd><dt id="builtins-attrNames"><a href="#builtins-attrNames"><code>attrNames <var>set</var></code></a></dt><dd>

Return the names of the attributes in the set *set* in an
alphabetically sorted list. For instance, `builtins.attrNames { y
= 1; x = "foo"; }` evaluates to `[ "x" "y" ]`.

</dd><dt id="builtins-attrValues"><a href="#builtins-attrValues"><code>attrValues <var>set</var></code></a></dt><dd>

Return the values of the attributes in the set *set* in the order
corresponding to the sorted attribute names.

</dd><dt id="builtins-baseNameOf"><a href="#builtins-baseNameOf"><code>baseNameOf <var>s</var></code></a></dt><dd>

Return the *base name* of the string *s*, that is, everything
following the final slash in the string. This is similar to the GNU
`basename` command.

</dd><dt id="builtins-bitAnd"><a href="#builtins-bitAnd"><code>bitAnd <var>e1</var> <var>e2</var></code></a></dt><dd>

Return the bitwise AND of the integers *e1* and *e2*.

</dd><dt id="builtins-bitOr"><a href="#builtins-bitOr"><code>bitOr <var>e1</var> <var>e2</var></code></a></dt><dd>

Return the bitwise OR of the integers *e1* and *e2*.

</dd><dt id="builtins-bitXor"><a href="#builtins-bitXor"><code>bitXor <var>e1</var> <var>e2</var></code></a></dt><dd>

Return the bitwise XOR of the integers *e1* and *e2*.

</dd><dt id="builtins-break"><a href="#builtins-break"><code>break <var>v</var></code></a></dt><dd>

In debug mode (enabled using `--debugger`), pause Nix expression evaluation and enter the REPL.
Otherwise, return the argument `v`.

</dd><dt id="builtins-catAttrs"><a href="#builtins-catAttrs"><code>catAttrs <var>attr</var> <var>list</var></code></a></dt><dd>

Collect each attribute named *attr* from a list of attribute
sets.  Attrsets that don't contain the named attribute are
ignored. For example,

```nix
builtins.catAttrs "a" [{a = 1;} {b = 0;} {a = 2;}]
```

evaluates to `[1 2]`.

</dd><dt id="builtins-ceil"><a href="#builtins-ceil"><code>ceil <var>double</var></code></a></dt><dd>

Converts an IEEE-754 double-precision floating-point number (*double*) to
the next higher integer.

If the datatype is neither an integer nor a "float", an evaluation error will be
thrown.

</dd><dt id="builtins-compareVersions"><a href="#builtins-compareVersions"><code>compareVersions <var>s1</var> <var>s2</var></code></a></dt><dd>

Compare two strings representing versions and return `-1` if
version *s1* is older than version *s2*, `0` if they are the same,
and `1` if *s1* is newer than *s2*. The version comparison
algorithm is the same as the one used by [`nix-env
-u`](../command-ref/nix-env.md#operation---upgrade).

</dd><dt id="builtins-concatLists"><a href="#builtins-concatLists"><code>concatLists <var>lists</var></code></a></dt><dd>

Concatenate a list of lists into a single list.

</dd><dt id="builtins-concatMap"><a href="#builtins-concatMap"><code>concatMap <var>f</var> <var>list</var></code></a></dt><dd>

This function is equivalent to `builtins.concatLists (map f list)`
but is more efficient.

</dd><dt id="builtins-concatStringsSep"><a href="#builtins-concatStringsSep"><code>concatStringsSep <var>separator</var> <var>list</var></code></a></dt><dd>

Concatenate a list of strings with a separator between each
element, e.g. `concatStringsSep "/" ["usr" "local" "bin"] ==
"usr/local/bin"`.

</dd><dt id="builtins-deepSeq"><a href="#builtins-deepSeq"><code>deepSeq <var>e1</var> <var>e2</var></code></a></dt><dd>

This is like `seq e1 e2`, except that *e1* is evaluated *deeply*:
if it’s a list or set, its elements or attributes are also
evaluated recursively.

</dd><dt id="builtins-dirOf"><a href="#builtins-dirOf"><code>dirOf <var>s</var></code></a></dt><dd>

Return the directory part of the string *s*, that is, everything
before the final slash in the string. This is similar to the GNU
`dirname` command.

</dd><dt id="builtins-div"><a href="#builtins-div"><code>div <var>e1</var> <var>e2</var></code></a></dt><dd>

Return the quotient of the numbers *e1* and *e2*.

</dd><dt id="builtins-elem"><a href="#builtins-elem"><code>elem <var>x</var> <var>xs</var></code></a></dt><dd>

Return `true` if a value equal to *x* occurs in the list *xs*, and
`false` otherwise.

</dd><dt id="builtins-elemAt"><a href="#builtins-elemAt"><code>elemAt <var>xs</var> <var>n</var></code></a></dt><dd>

Return element *n* from the list *xs*. Elements are counted starting
from 0. A fatal error occurs if the index is out of bounds.

</dd><dt id="builtins-fetchClosure"><a href="#builtins-fetchClosure"><code>fetchClosure <var>args</var></code></a></dt><dd>

Fetch a Nix store closure from a binary cache, rewriting it into
content-addressed form. For example,

```nix
builtins.fetchClosure {
  fromStore = "https://cache.nixos.org";
  fromPath = /nix/store/r2jd6ygnmirm2g803mksqqjm4y39yi6i-git-2.33.1;
  toPath = /nix/store/ldbhlwhh39wha58rm61bkiiwm6j7211j-git-2.33.1;
}
```

fetches `/nix/store/r2jd...` from the specified binary cache,
and rewrites it into the content-addressed store path
`/nix/store/ldbh...`.

If `fromPath` is already content-addressed, or if you are
allowing impure evaluation (`--impure`), then `toPath` may be
omitted.

To find out the correct value for `toPath` given a `fromPath`,
you can use `nix store make-content-addressed`:

```console
# nix store make-content-addressed --from https://cache.nixos.org /nix/store/r2jd6ygnmirm2g803mksqqjm4y39yi6i-git-2.33.1
rewrote '/nix/store/r2jd6ygnmirm2g803mksqqjm4y39yi6i-git-2.33.1' to '/nix/store/ldbhlwhh39wha58rm61bkiiwm6j7211j-git-2.33.1'
```

This function is similar to `builtins.storePath` in that it
allows you to use a previously built store path in a Nix
expression. However, it is more reproducible because it requires
specifying a binary cache from which the path can be fetched.
Also, requiring a content-addressed final store path avoids the
need for users to configure binary cache public keys.

This function is only available if you enable the experimental
feature `fetch-closure`.

</dd><dt id="builtins-fetchGit"><a href="#builtins-fetchGit"><code>fetchGit <var>args</var></code></a></dt><dd>

Fetch a path from git. *args* can be a URL, in which case the HEAD
of the repo at that URL is fetched. Otherwise, it can be an
attribute with the following attributes (all except `url` optional):

  - url\
    The URL of the repo.

  - name\
    The name of the directory the repo should be exported to in the
    store. Defaults to the basename of the URL.

  - rev\
    The git revision to fetch. Defaults to the tip of `ref`.

  - ref\
    The git ref to look for the requested revision under. This is
    often a branch or tag name. Defaults to `HEAD`.

    By default, the `ref` value is prefixed with `refs/heads/`. As
    of Nix 2.3.0 Nix will not prefix `refs/heads/` if `ref` starts
    with `refs/`.

  - submodules\
    A Boolean parameter that specifies whether submodules should be
    checked out. Defaults to `false`.

  - shallow\
    A Boolean parameter that specifies whether fetching a shallow clone
    is allowed. Defaults to `false`.

  - allRefs\
    Whether to fetch all refs of the repository. With this argument being
    true, it's possible to load a `rev` from *any* `ref` (by default only
    `rev`s from the specified `ref` are supported).

Here are some examples of how to use `fetchGit`.

  - To fetch a private repository over SSH:

    ```nix
    builtins.fetchGit {
      url = "git@github.com:my-secret/repository.git";
      ref = "master";
      rev = "adab8b916a45068c044658c4158d81878f9ed1c3";
    }
    ```

  - To fetch an arbitrary reference:

    ```nix
    builtins.fetchGit {
      url = "https://github.com/NixOS/nix.git";
      ref = "refs/heads/0.5-release";
    }
    ```

  - If the revision you're looking for is in the default branch of
    the git repository you don't strictly need to specify the branch
    name in the `ref` attribute.

    However, if the revision you're looking for is in a future
    branch for the non-default branch you will need to specify the
    the `ref` attribute as well.

    ```nix
    builtins.fetchGit {
      url = "https://github.com/nixos/nix.git";
      rev = "841fcbd04755c7a2865c51c1e2d3b045976b7452";
      ref = "1.11-maintenance";
    }
    ```

    > **Note**
    >
    > It is nice to always specify the branch which a revision
    > belongs to. Without the branch being specified, the fetcher
    > might fail if the default branch changes. Additionally, it can
    > be confusing to try a commit from a non-default branch and see
    > the fetch fail. If the branch is specified the fault is much
    > more obvious.

  - If the revision you're looking for is in the default branch of
    the git repository you may omit the `ref` attribute.

    ```nix
    builtins.fetchGit {
      url = "https://github.com/nixos/nix.git";
      rev = "841fcbd04755c7a2865c51c1e2d3b045976b7452";
    }
    ```

  - To fetch a specific tag:

    ```nix
    builtins.fetchGit {
      url = "https://github.com/nixos/nix.git";
      ref = "refs/tags/1.9";
    }
    ```

  - To fetch the latest version of a remote branch:

    ```nix
    builtins.fetchGit {
      url = "ssh://git@github.com/nixos/nix.git";
      ref = "master";
    }
    ```

    > **Note**
    >
    > Nix will refetch the branch in accordance with
    > the option `tarball-ttl`.

    > **Note**
    >
    > This behavior is disabled in *Pure evaluation mode*.

</dd><dt id="builtins-fetchTarball"><a href="#builtins-fetchTarball"><code>fetchTarball <var>args</var></code></a></dt><dd>

Download the specified URL, unpack it and return the path of the
unpacked tree. The file must be a tape archive (`.tar`) compressed
with `gzip`, `bzip2` or `xz`. The top-level path component of the
files in the tarball is removed, so it is best if the tarball
contains a single directory at top level. The typical use of the
function is to obtain external Nix expression dependencies, such as
a particular version of Nixpkgs, e.g.

```nix
with import (fetchTarball https://github.com/NixOS/nixpkgs/archive/nixos-14.12.tar.gz) {};

stdenv.mkDerivation { … }
```

The fetched tarball is cached for a certain amount of time (1
hour by default) in `~/.cache/nix/tarballs/`. You can change the
cache timeout either on the command line with `--tarball-ttl`
*number-of-seconds* or in the Nix configuration file by adding
the line `tarball-ttl = ` *number-of-seconds*.

Note that when obtaining the hash with `nix-prefetch-url` the
option `--unpack` is required.

This function can also verify the contents against a hash. In that
case, the function takes a set instead of a URL. The set requires
the attribute `url` and the attribute `sha256`, e.g.

```nix
with import (fetchTarball {
  url = "https://github.com/NixOS/nixpkgs/archive/nixos-14.12.tar.gz";
  sha256 = "1jppksrfvbk5ypiqdz4cddxdl8z6zyzdb2srq8fcffr327ld5jj2";
}) {};

stdenv.mkDerivation { … }
```

This function is not available if [restricted evaluation
mode](../command-ref/conf-file.md) is enabled.

</dd><dt id="builtins-fetchurl"><a href="#builtins-fetchurl"><code>fetchurl <var>url</var></code></a></dt><dd>

Download the specified URL and return the path of the downloaded
file. This function is not available if [restricted evaluation
mode](../command-ref/conf-file.md) is enabled.

</dd><dt id="builtins-filter"><a href="#builtins-filter"><code>filter <var>f</var> <var>list</var></code></a></dt><dd>

Return a list consisting of the elements of *list* for which the
function *f* returns `true`.

</dd><dt id="builtins-filterSource"><a href="#builtins-filterSource"><code>filterSource <var>e1</var> <var>e2</var></code></a></dt><dd>

> **Warning**
>
> `filterSource` should not be used to filter store paths. Since
> `filterSource` uses the name of the input directory while naming
> the output directory, doing so will produce a directory name in
> the form of `<hash2>-<hash>-<name>`, where `<hash>-<name>` is
> the name of the input directory. Since `<hash>` depends on the
> unfiltered directory, the name of the output directory will
> indirectly depend on files that are filtered out by the
> function. This will trigger a rebuild even when a filtered out
> file is changed. Use `builtins.path` instead, which allows
> specifying the name of the output directory.

This function allows you to copy sources into the Nix store while
filtering certain files. For instance, suppose that you want to use
the directory `source-dir` as an input to a Nix expression, e.g.

```nix
stdenv.mkDerivation {
  ...
  src = ./source-dir;
}
```

However, if `source-dir` is a Subversion working copy, then all
those annoying `.svn` subdirectories will also be copied to the
store. Worse, the contents of those directories may change a lot,
causing lots of spurious rebuilds. With `filterSource` you can
filter out the `.svn` directories:

```nix
src = builtins.filterSource
  (path: type: type != "directory" || baseNameOf path != ".svn")
  ./source-dir;
```

Thus, the first argument *e1* must be a predicate function that is
called for each regular file, directory or symlink in the source
tree *e2*. If the function returns `true`, the file is copied to the
Nix store, otherwise it is omitted. The function is called with two
arguments. The first is the full path of the file. The second is a
string that identifies the type of the file, which is either
`"regular"`, `"directory"`, `"symlink"` or `"unknown"` (for other
kinds of files such as device nodes or fifos — but note that those
cannot be copied to the Nix store, so if the predicate returns
`true` for them, the copy will fail). If you exclude a directory,
the entire corresponding subtree of *e2* will be excluded.

</dd><dt id="builtins-floor"><a href="#builtins-floor"><code>floor <var>double</var></code></a></dt><dd>

Converts an IEEE-754 double-precision floating-point number (*double*) to
the next lower integer.

If the datatype is neither an integer nor a "float", an evaluation error will be
thrown.

</dd><dt id="builtins-foldl'"><a href="#builtins-foldl'"><code>foldl' <var>op</var> <var>nul</var> <var>list</var></code></a></dt><dd>

Reduce a list by applying a binary operator, from left to right,
e.g. `foldl' op nul [x0 x1 x2 ...] = op (op (op nul x0) x1) x2)
...`. The operator is applied strictly, i.e., its arguments are
evaluated first. For example, `foldl' (x: y: x + y) 0 [1 2 3]`
evaluates to 6.

</dd><dt id="builtins-fromJSON"><a href="#builtins-fromJSON"><code>fromJSON <var>e</var></code></a></dt><dd>

Convert a JSON string to a Nix value. For example,

```nix
builtins.fromJSON ''{"x": [1, 2, 3], "y": null}''
```

returns the value `{ x = [ 1 2 3 ]; y = null; }`.

</dd><dt id="builtins-functionArgs"><a href="#builtins-functionArgs"><code>functionArgs <var>f</var></code></a></dt><dd>

Return a set containing the names of the formal arguments expected
by the function *f*. The value of each attribute is a Boolean
denoting whether the corresponding argument has a default value. For
instance, `functionArgs ({ x, y ? 123}: ...) = { x = false; y =
true; }`.

"Formal argument" here refers to the attributes pattern-matched by
the function. Plain lambdas are not included, e.g. `functionArgs (x:
...) = { }`.

</dd><dt id="builtins-genList"><a href="#builtins-genList"><code>genList <var>generator</var> <var>length</var></code></a></dt><dd>

Generate list of size *length*, with each element *i* equal to the
value returned by *generator* `i`. For example,

```nix
builtins.genList (x: x * x) 5
```

returns the list `[ 0 1 4 9 16 ]`.

</dd><dt id="builtins-genericClosure"><a href="#builtins-genericClosure"><code>genericClosure <var>attrset</var></code></a></dt><dd>

Take an *attrset* with values named `startSet` and `operator` in order to
return a *list of attrsets* by starting with the `startSet`, recursively
applying the `operator` function to each element. The *attrsets* in the
`startSet` and produced by the `operator` must each contain value named
`key` which are comparable to each other. The result is produced by
repeatedly calling the operator for each element encountered with a
unique key, terminating when no new elements are produced. For example,

```
builtins.genericClosure {
  startSet = [ {key = 5;} ];
  operator = item: [{
    key = if (item.key / 2 ) * 2 == item.key
         then item.key / 2
         else 3 * item.key + 1;
  }];
}
```
evaluates to
```
[ { key = 5; } { key = 16; } { key = 8; } { key = 4; } { key = 2; } { key = 1; } ]
```

</dd><dt id="builtins-getAttr"><a href="#builtins-getAttr"><code>getAttr <var>s</var> <var>set</var></code></a></dt><dd>

`getAttr` returns the attribute named *s* from *set*. Evaluation
aborts if the attribute doesn’t exist. This is a dynamic version of
the `.` operator, since *s* is an expression rather than an
identifier.

</dd><dt id="builtins-getEnv"><a href="#builtins-getEnv"><code>getEnv <var>s</var></code></a></dt><dd>

`getEnv` returns the value of the environment variable *s*, or an
empty string if the variable doesn’t exist. This function should be
used with care, as it can introduce all sorts of nasty environment
dependencies in your Nix expression.

`getEnv` is used in Nix Packages to locate the file
`~/.nixpkgs/config.nix`, which contains user-local settings for Nix
Packages. (That is, it does a `getEnv "HOME"` to locate the user’s
home directory.)

</dd><dt id="builtins-getFlake"><a href="#builtins-getFlake"><code>getFlake <var>args</var></code></a></dt><dd>

Fetch a flake from a flake reference, and return its output attributes and some metadata. For example:

```nix
(builtins.getFlake "nix/55bc52401966fbffa525c574c14f67b00bc4fb3a").packages.x86_64-linux.nix
```

Unless impure evaluation is allowed (`--impure`), the flake reference
must be "locked", e.g. contain a Git revision or content hash. An
example of an unlocked usage is:

```nix
(builtins.getFlake "github:edolstra/dwarffs").rev
```

This function is only available if you enable the experimental feature
`flakes`.

</dd><dt id="builtins-groupBy"><a href="#builtins-groupBy"><code>groupBy <var>f</var> <var>list</var></code></a></dt><dd>

Groups elements of *list* together by the string returned from the
function *f* called on each element. It returns an attribute set
where each attribute value contains the elements of *list* that are
mapped to the same corresponding attribute name returned by *f*.

For example,

```nix
builtins.groupBy (builtins.substring 0 1) ["foo" "bar" "baz"]
```

evaluates to

```nix
{ b = [ "bar" "baz" ]; f = [ "foo" ]; }
```

</dd><dt id="builtins-hasAttr"><a href="#builtins-hasAttr"><code>hasAttr <var>s</var> <var>set</var></code></a></dt><dd>

`hasAttr` returns `true` if *set* has an attribute named *s*, and
`false` otherwise. This is a dynamic version of the `?` operator,
since *s* is an expression rather than an identifier.

</dd><dt id="builtins-hashFile"><a href="#builtins-hashFile"><code>hashFile <var>type</var> <var>p</var></code></a></dt><dd>

Return a base-16 representation of the cryptographic hash of the
file at path *p*. The hash algorithm specified by *type* must be one
of `"md5"`, `"sha1"`, `"sha256"` or `"sha512"`.

</dd><dt id="builtins-hashString"><a href="#builtins-hashString"><code>hashString <var>type</var> <var>s</var></code></a></dt><dd>

Return a base-16 representation of the cryptographic hash of string
*s*. The hash algorithm specified by *type* must be one of `"md5"`,
`"sha1"`, `"sha256"` or `"sha512"`.

</dd><dt id="builtins-head"><a href="#builtins-head"><code>head <var>list</var></code></a></dt><dd>

Return the first element of a list; abort evaluation if the argument
isn’t a list or is an empty list. You can test whether a list is
empty by comparing it with `[]`.

</dd><dt id="builtins-import"><a href="#builtins-import"><code>import <var>path</var></code></a></dt><dd>

Load, parse and return the Nix expression in the file *path*. If
*path* is a directory, the file ` default.nix ` in that directory
is loaded. Evaluation aborts if the file doesn’t exist or contains
an incorrect Nix expression. `import` implements Nix’s module
system: you can put any Nix expression (such as a set or a
function) in a separate file, and use it from Nix expressions in
other files.

> **Note**
>
> Unlike some languages, `import` is a regular function in Nix.
> Paths using the angle bracket syntax (e.g., `import` *\<foo\>*)
> are [normal path values](language-values.md).

A Nix expression loaded by `import` must not contain any *free
variables* (identifiers that are not defined in the Nix expression
itself and are not built-in). Therefore, it cannot refer to
variables that are in scope at the call site. For instance, if you
have a calling expression

```nix
rec {
  x = 123;
  y = import ./foo.nix;
}
```

then the following `foo.nix` will give an error:

```nix
x + 456
```

since `x` is not in scope in `foo.nix`. If you want `x` to be
available in `foo.nix`, you should pass it as a function argument:

```nix
rec {
  x = 123;
  y = import ./foo.nix x;
}
```

and

```nix
x: x + 456
```

(The function argument doesn’t have to be called `x` in `foo.nix`;
any name would work.)

</dd><dt id="builtins-intersectAttrs"><a href="#builtins-intersectAttrs"><code>intersectAttrs <var>e1</var> <var>e2</var></code></a></dt><dd>

Return a set consisting of the attributes in the set *e2* that also
exist in the set *e1*.

</dd><dt id="builtins-isAttrs"><a href="#builtins-isAttrs"><code>isAttrs <var>e</var></code></a></dt><dd>

Return `true` if *e* evaluates to a set, and `false` otherwise.

</dd><dt id="builtins-isBool"><a href="#builtins-isBool"><code>isBool <var>e</var></code></a></dt><dd>

Return `true` if *e* evaluates to a bool, and `false` otherwise.

</dd><dt id="builtins-isFloat"><a href="#builtins-isFloat"><code>isFloat <var>e</var></code></a></dt><dd>

Return `true` if *e* evaluates to a float, and `false` otherwise.

</dd><dt id="builtins-isFunction"><a href="#builtins-isFunction"><code>isFunction <var>e</var></code></a></dt><dd>

Return `true` if *e* evaluates to a function, and `false` otherwise.

</dd><dt id="builtins-isInt"><a href="#builtins-isInt"><code>isInt <var>e</var></code></a></dt><dd>

Return `true` if *e* evaluates to an integer, and `false` otherwise.

</dd><dt id="builtins-isList"><a href="#builtins-isList"><code>isList <var>e</var></code></a></dt><dd>

Return `true` if *e* evaluates to a list, and `false` otherwise.

</dd><dt id="builtins-isNull"><a href="#builtins-isNull"><code>isNull <var>e</var></code></a></dt><dd>

Return `true` if *e* evaluates to `null`, and `false` otherwise.

> **Warning**
>
> This function is *deprecated*; just write `e == null` instead.

</dd><dt id="builtins-isPath"><a href="#builtins-isPath"><code>isPath <var>e</var></code></a></dt><dd>

Return `true` if *e* evaluates to a path, and `false` otherwise.

</dd><dt id="builtins-isString"><a href="#builtins-isString"><code>isString <var>e</var></code></a></dt><dd>

Return `true` if *e* evaluates to a string, and `false` otherwise.

</dd><dt id="builtins-length"><a href="#builtins-length"><code>length <var>e</var></code></a></dt><dd>

Return the length of the list *e*.

</dd><dt id="builtins-lessThan"><a href="#builtins-lessThan"><code>lessThan <var>e1</var> <var>e2</var></code></a></dt><dd>

Return `true` if the number *e1* is less than the number *e2*, and
`false` otherwise. Evaluation aborts if either *e1* or *e2* does not
evaluate to a number.

</dd><dt id="builtins-listToAttrs"><a href="#builtins-listToAttrs"><code>listToAttrs <var>e</var></code></a></dt><dd>

Construct a set from a list specifying the names and values of each
attribute. Each element of the list should be a set consisting of a
string-valued attribute `name` specifying the name of the attribute,
and an attribute `value` specifying its value. Example:

```nix
builtins.listToAttrs
  [ { name = "foo"; value = 123; }
    { name = "bar"; value = 456; }
  ]
```

evaluates to

```nix
{ foo = 123; bar = 456; }
```

</dd><dt id="builtins-map"><a href="#builtins-map"><code>map <var>f</var> <var>list</var></code></a></dt><dd>

Apply the function *f* to each element in the list *list*. For
example,

```nix
map (x: "foo" + x) [ "bar" "bla" "abc" ]
```

evaluates to `[ "foobar" "foobla" "fooabc" ]`.

</dd><dt id="builtins-mapAttrs"><a href="#builtins-mapAttrs"><code>mapAttrs <var>f</var> <var>attrset</var></code></a></dt><dd>

Apply function *f* to every element of *attrset*. For example,

```nix
builtins.mapAttrs (name: value: value * 10) { a = 1; b = 2; }
```

evaluates to `{ a = 10; b = 20; }`.

</dd><dt id="builtins-match"><a href="#builtins-match"><code>match <var>regex</var> <var>str</var></code></a></dt><dd>

Returns a list if the [extended POSIX regular
expression](http://pubs.opengroup.org/onlinepubs/9699919799/basedefs/V1_chap09.html#tag_09_04)
*regex* matches *str* precisely, otherwise returns `null`. Each item
in the list is a regex group.

```nix
builtins.match "ab" "abc"
```

Evaluates to `null`.

```nix
builtins.match "abc" "abc"
```

Evaluates to `[ ]`.

```nix
builtins.match "a(b)(c)" "abc"
```

Evaluates to `[ "b" "c" ]`.

```nix
builtins.match "[[:space:]]+([[:upper:]]+)[[:space:]]+" "  FOO   "
```

Evaluates to `[ "FOO" ]`.

</dd><dt id="builtins-mul"><a href="#builtins-mul"><code>mul <var>e1</var> <var>e2</var></code></a></dt><dd>

Return the product of the numbers *e1* and *e2*.

</dd><dt id="builtins-parseDrvName"><a href="#builtins-parseDrvName"><code>parseDrvName <var>s</var></code></a></dt><dd>

Split the string *s* into a package name and version. The package
name is everything up to but not including the first dash followed
by a digit, and the version is everything following that dash. The
result is returned in a set `{ name, version }`. Thus,
`builtins.parseDrvName "nix-0.12pre12876"` returns `{ name =
"nix"; version = "0.12pre12876"; }`.

</dd><dt id="builtins-partition"><a href="#builtins-partition"><code>partition <var>pred</var> <var>list</var></code></a></dt><dd>

Given a predicate function *pred*, this function returns an
attrset containing a list named `right`, containing the elements
in *list* for which *pred* returned `true`, and a list named
`wrong`, containing the elements for which it returned
`false`. For example,

```nix
builtins.partition (x: x > 10) [1 23 9 3 42]
```

evaluates to

```nix
{ right = [ 23 42 ]; wrong = [ 1 9 3 ]; }
```

</dd><dt id="builtins-path"><a href="#builtins-path"><code>path <var>args</var></code></a></dt><dd>

An enrichment of the built-in path type, based on the attributes
present in *args*. All are optional except `path`:

  - path\
    The underlying path.

  - name\
    The name of the path when added to the store. This can used to
    reference paths that have nix-illegal characters in their names,
    like `@`.

  - filter\
    A function of the type expected by `builtins.filterSource`,
    with the same semantics.

  - recursive\
    When `false`, when `path` is added to the store it is with a
    flat hash, rather than a hash of the NAR serialization of the
    file. Thus, `path` must refer to a regular file, not a
    directory. This allows similar behavior to `fetchurl`. Defaults
    to `true`.

  - sha256\
    When provided, this is the expected hash of the file at the
    path. Evaluation will fail if the hash is incorrect, and
    providing a hash allows `builtins.path` to be used even when the
    `pure-eval` nix config option is on.

</dd><dt id="builtins-pathExists"><a href="#builtins-pathExists"><code>pathExists <var>path</var></code></a></dt><dd>

Return `true` if the path *path* exists at evaluation time, and
`false` otherwise.

</dd><dt id="builtins-placeholder"><a href="#builtins-placeholder"><code>placeholder <var>output</var></code></a></dt><dd>

Return a placeholder string for the specified *output* that will be
substituted by the corresponding output path at build time. Typical
outputs would be `"out"`, `"bin"` or `"dev"`.

</dd><dt id="builtins-readDir"><a href="#builtins-readDir"><code>readDir <var>path</var></code></a></dt><dd>

Return the contents of the directory *path* as a set mapping
directory entries to the corresponding file type. For instance, if
directory `A` contains a regular file `B` and another directory
`C`, then `builtins.readDir ./A` will return the set

```nix
{ B = "regular"; C = "directory"; }
```

The possible values for the file type are `"regular"`,
`"directory"`, `"symlink"` and `"unknown"`.

</dd><dt id="builtins-readFile"><a href="#builtins-readFile"><code>readFile <var>path</var></code></a></dt><dd>

Return the contents of the file *path* as a string.

</dd><dt id="builtins-removeAttrs"><a href="#builtins-removeAttrs"><code>removeAttrs <var>set</var> <var>list</var></code></a></dt><dd>

Remove the attributes listed in *list* from *set*. The attributes
don’t have to exist in *set*. For instance,

```nix
removeAttrs { x = 1; y = 2; z = 3; } [ "a" "x" "z" ]
```

evaluates to `{ y = 2; }`.

</dd><dt id="builtins-replaceStrings"><a href="#builtins-replaceStrings"><code>replaceStrings <var>from</var> <var>to</var> <var>s</var></code></a></dt><dd>

Given string *s*, replace every occurrence of the strings in *from*
with the corresponding string in *to*. For example,

```nix
builtins.replaceStrings ["oo" "a"] ["a" "i"] "foobar"
```

evaluates to `"fabir"`.

</dd><dt id="builtins-seq"><a href="#builtins-seq"><code>seq <var>e1</var> <var>e2</var></code></a></dt><dd>

Evaluate *e1*, then evaluate and return *e2*. This ensures that a
computation is strict in the value of *e1*.

</dd><dt id="builtins-sort"><a href="#builtins-sort"><code>sort <var>comparator</var> <var>list</var></code></a></dt><dd>

Return *list* in sorted order. It repeatedly calls the function
*comparator* with two elements. The comparator should return `true`
if the first element is less than the second, and `false` otherwise.
For example,

```nix
builtins.sort builtins.lessThan [ 483 249 526 147 42 77 ]
```

produces the list `[ 42 77 147 249 483 526 ]`.

This is a stable sort: it preserves the relative order of elements
deemed equal by the comparator.

</dd><dt id="builtins-split"><a href="#builtins-split"><code>split <var>regex</var> <var>str</var></code></a></dt><dd>

Returns a list composed of non matched strings interleaved with the
lists of the [extended POSIX regular
expression](http://pubs.opengroup.org/onlinepubs/9699919799/basedefs/V1_chap09.html#tag_09_04)
*regex* matches of *str*. Each item in the lists of matched
sequences is a regex group.

```nix
builtins.split "(a)b" "abc"
```

Evaluates to `[ "" [ "a" ] "c" ]`.

```nix
builtins.split "([ac])" "abc"
```

Evaluates to `[ "" [ "a" ] "b" [ "c" ] "" ]`.

```nix
builtins.split "(a)|(c)" "abc"
```

Evaluates to `[ "" [ "a" null ] "b" [ null "c" ] "" ]`.

```nix
builtins.split "([[:upper:]]+)" " FOO "
```

Evaluates to `[ " " [ "FOO" ] " " ]`.

</dd><dt id="builtins-splitVersion"><a href="#builtins-splitVersion"><code>splitVersion <var>s</var></code></a></dt><dd>

Split a string representing a version into its components, by the
same version splitting logic underlying the version comparison in
[`nix-env -u`](../command-ref/nix-env.md#operation---upgrade).

</dd><dt id="builtins-storePath"><a href="#builtins-storePath"><code>storePath <var>path</var></code></a></dt><dd>

This function allows you to define a dependency on an already
existing store path. For example, the derivation attribute `src
= builtins.storePath /nix/store/f1d18v1y…-source` causes the
derivation to depend on the specified path, which must exist or
be substitutable. Note that this differs from a plain path
(e.g. `src = /nix/store/f1d18v1y…-source`) in that the latter
causes the path to be *copied* again to the Nix store, resulting
in a new path (e.g. `/nix/store/ld01dnzc…-source-source`).

This function is not available in pure evaluation mode.

</dd><dt id="builtins-stringLength"><a href="#builtins-stringLength"><code>stringLength <var>e</var></code></a></dt><dd>

Return the length of the string *e*. If *e* is not a string,
evaluation is aborted.

</dd><dt id="builtins-sub"><a href="#builtins-sub"><code>sub <var>e1</var> <var>e2</var></code></a></dt><dd>

Return the difference between the numbers *e1* and *e2*.

</dd><dt id="builtins-substring"><a href="#builtins-substring"><code>substring <var>start</var> <var>len</var> <var>s</var></code></a></dt><dd>

Return the substring of *s* from character position *start*
(zero-based) up to but not including *start + len*. If *start* is
greater than the length of the string, an empty string is returned,
and if *start + len* lies beyond the end of the string, only the
substring up to the end of the string is returned. *start* must be
non-negative. For example,

```nix
builtins.substring 0 3 "nixos"
```

evaluates to `"nix"`.

</dd><dt id="builtins-tail"><a href="#builtins-tail"><code>tail <var>list</var></code></a></dt><dd>

Return the second to last elements of a list; abort evaluation if
the argument isn’t a list or is an empty list.

> **Warning**
>
> This function should generally be avoided since it's inefficient:
> unlike Haskell's `tail`, it takes O(n) time, so recursing over a
> list by repeatedly calling `tail` takes O(n^2) time.

</dd><dt id="builtins-throw"><a href="#builtins-throw"><code>throw <var>s</var></code></a></dt><dd>

Throw an error message *s*. This usually aborts Nix expression
evaluation, but in `nix-env -qa` and other commands that try to
evaluate a set of derivations to get information about those
derivations, a derivation that throws an error is silently skipped
(which is not the case for `abort`).

</dd><dt id="builtins-toFile"><a href="#builtins-toFile"><code>toFile <var>name</var> <var>s</var></code></a></dt><dd>

Store the string *s* in a file in the Nix store and return its
path.  The file has suffix *name*. This file can be used as an
input to derivations. One application is to write builders
“inline”. For instance, the following Nix expression combines the
[Nix expression for GNU Hello](expression-syntax.md) and its
[build script](build-script.md) into one file:

```nix
{ stdenv, fetchurl, perl }:

stdenv.mkDerivation {
  name = "hello-2.1.1";

  builder = builtins.toFile "builder.sh" "
    source $stdenv/setup

    PATH=$perl/bin:$PATH

    tar xvfz $src
    cd hello-*
    ./configure --prefix=$out
    make
    make install
  ";

  src = fetchurl {
    url = "http://ftp.nluug.nl/pub/gnu/hello/hello-2.1.1.tar.gz";
    sha256 = "1md7jsfd8pa45z73bz1kszpp01yw6x5ljkjk2hx7wl800any6465";
  };
  inherit perl;
}
```

It is even possible for one file to refer to another, e.g.,

```nix
builder = let
  configFile = builtins.toFile "foo.conf" "
    # This is some dummy configuration file.
    ...
  ";
in builtins.toFile "builder.sh" "
  source $stdenv/setup
  ...
  cp ${configFile} $out/etc/foo.conf
";
```

Note that `${configFile}` is an
[antiquotation](language-values.md), so the result of the
expression `configFile`
(i.e., a path like `/nix/store/m7p7jfny445k...-foo.conf`) will be
spliced into the resulting string.

It is however *not* allowed to have files mutually referring to each
other, like so:

```nix
let
  foo = builtins.toFile "foo" "...${bar}...";
  bar = builtins.toFile "bar" "...${foo}...";
in foo
```

This is not allowed because it would cause a cyclic dependency in
the computation of the cryptographic hashes for `foo` and `bar`.

It is also not possible to reference the result of a derivation. If
you are using Nixpkgs, the `writeTextFile` function is able to do
that.

</dd><dt id="builtins-toJSON"><a href="#builtins-toJSON"><code>toJSON <var>e</var></code></a></dt><dd>

Return a string containing a JSON representation of *e*. Strings,
integers, floats, booleans, nulls and lists are mapped to their JSON
equivalents. Sets (except derivations) are represented as objects.
Derivations are translated to a JSON string containing the
derivation’s output path. Paths are copied to the store and
represented as a JSON string of the resulting store path.

</dd><dt id="builtins-toPath"><a href="#builtins-toPath"><code>toPath <var>s</var></code></a></dt><dd>

**DEPRECATED.** Use `/. + "/path"` to convert a string into an absolute
path. For relative paths, use `./. + "/path"`.

</dd><dt id="builtins-toString"><a href="#builtins-toString"><code>toString <var>e</var></code></a></dt><dd>

Convert the expression *e* to a string. *e* can be:

  - A string (in which case the string is returned unmodified).

  - A path (e.g., `toString /foo/bar` yields `"/foo/bar"`.

  - A set containing `{ __toString = self: ...; }` or `{ outPath = ...; }`.

  - An integer.

  - A list, in which case the string representations of its elements
    are joined with spaces.

  - A Boolean (`false` yields `""`, `true` yields `"1"`).

  - `null`, which yields the empty string.

</dd><dt id="builtins-toXML"><a href="#builtins-toXML"><code>toXML <var>e</var></code></a></dt><dd>

Return a string containing an XML representation of *e*. The main
application for `toXML` is to communicate information with the
builder in a more structured format than plain environment
variables.

Here is an example where this is the case:

```nix
{ stdenv, fetchurl, libxslt, jira, uberwiki }:

stdenv.mkDerivation (rec {
  name = "web-server";

  buildInputs = [ libxslt ];

  builder = builtins.toFile "builder.sh" "
    source $stdenv/setup
    mkdir $out
    echo "$servlets" | xsltproc ${stylesheet} - > $out/server-conf.xml ①
  ";

  stylesheet = builtins.toFile "stylesheet.xsl" ②
   "<?xml version='1.0' encoding='UTF-8'?>
    <xsl:stylesheet xmlns:xsl='http://www.w3.org/1999/XSL/Transform' version='1.0'>
      <xsl:template match='/'>
        <Configure>
          <xsl:for-each select='/expr/list/attrs'>
            <Call name='addWebApplication'>
              <Arg><xsl:value-of select=\"attr[@name = 'path']/string/@value\" /></Arg>
              <Arg><xsl:value-of select=\"attr[@name = 'war']/path/@value\" /></Arg>
            </Call>
          </xsl:for-each>
        </Configure>
      </xsl:template>
    </xsl:stylesheet>
  ";

  servlets = builtins.toXML [ ③
    { path = "/bugtracker"; war = jira + "/lib/atlassian-jira.war"; }
    { path = "/wiki"; war = uberwiki + "/uberwiki.war"; }
  ];
})
```

The builder is supposed to generate the configuration file for a
[Jetty servlet container](http://jetty.mortbay.org/). A servlet
container contains a number of servlets (`*.war` files) each
exported under a specific URI prefix. So the servlet configuration
is a list of sets containing the `path` and `war` of the servlet
(①). This kind of information is difficult to communicate with the
normal method of passing information through an environment
variable, which just concatenates everything together into a
string (which might just work in this case, but wouldn’t work if
fields are optional or contain lists themselves). Instead the Nix
expression is converted to an XML representation with `toXML`,
which is unambiguous and can easily be processed with the
appropriate tools. For instance, in the example an XSLT stylesheet
(at point ②) is applied to it (at point ①) to generate the XML
configuration file for the Jetty server. The XML representation
produced at point ③ by `toXML` is as follows:

```xml
<?xml version='1.0' encoding='utf-8'?>
<expr>
  <list>
    <attrs>
      <attr name="path">
        <string value="/bugtracker" />
      </attr>
      <attr name="war">
        <path value="/nix/store/d1jh9pasa7k2...-jira/lib/atlassian-jira.war" />
      </attr>
    </attrs>
    <attrs>
      <attr name="path">
        <string value="/wiki" />
      </attr>
      <attr name="war">
        <path value="/nix/store/y6423b1yi4sx...-uberwiki/uberwiki.war" />
      </attr>
    </attrs>
  </list>
</expr>
```

Note that we used the `toFile` built-in to write the builder and
the stylesheet “inline” in the Nix expression. The path of the
stylesheet is spliced into the builder using the syntax `xsltproc
${stylesheet}`.

</dd><dt id="builtins-trace"><a href="#builtins-trace"><code>trace <var>e1</var> <var>e2</var></code></a></dt><dd>

Evaluate *e1* and print its abstract syntax representation on
standard error. Then return *e2*. This function is useful for
debugging.

</dd><dt id="builtins-tryEval"><a href="#builtins-tryEval"><code>tryEval <var>e</var></code></a></dt><dd>

Try to shallowly evaluate *e*. Return a set containing the
attributes `success` (`true` if *e* evaluated successfully,
`false` if an error was thrown) and `value`, equalling *e* if
successful and `false` otherwise. `tryEval` will only prevent
errors created by `throw` or `assert` from being thrown.
Errors `tryEval` will not catch are for example those created
by `abort` and type errors generated by builtins. Also note that
this doesn't evaluate *e* deeply, so `let e = { x = throw ""; };
in (builtins.tryEval e).success` will be `true`. Using
`builtins.deepSeq` one can get the expected result:
`let e = { x = throw ""; }; in
(builtins.tryEval (builtins.deepSeq e e)).success` will be
`false`.

</dd><dt id="builtins-typeOf"><a href="#builtins-typeOf"><code>typeOf <var>e</var></code></a></dt><dd>

Return a string representing the type of the value *e*, namely
`"int"`, `"bool"`, `"string"`, `"path"`, `"null"`, `"set"`,
`"list"`, `"lambda"` or `"float"`.

</dd><dt id="builtins-zipAttrsWith"><a href="#builtins-zipAttrsWith"><code>zipAttrsWith <var>f</var> <var>list</var></code></a></dt><dd>

Transpose a list of attribute sets into an attribute set of lists,
then apply `mapAttrs`.

`f` receives two arguments: the attribute name and a non-empty
list of all values encountered for that attribute name.

The result is an attribute set where the attribute names are the
union of the attribute names in each element of `list`. The attribute
values are the return values of `f`.

```nix
builtins.zipAttrsWith
  (name: values: { inherit name values; })
  [ { a = "x"; } { a = "y"; b = "z"; } ]
```

evaluates to

```
{
  a = { name = "a"; values = [ "x" "y" ]; };
  b = { name = "b"; values = [ "z" ]; };
}
```

</dd></dl>
