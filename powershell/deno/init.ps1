using namespace System.Management.Automation
using namespace System.Management.Automation.Language

Register-ArgumentCompleter -Native -CommandName 'deno' -ScriptBlock {
    param($wordToComplete, $commandAst, $cursorPosition)

    $commandElements = $commandAst.CommandElements
    $command = @(
        'deno'
        for ($i = 1; $i -lt $commandElements.Count; $i++) {
            $element = $commandElements[$i]
            if ($element -isnot [StringConstantExpressionAst] -or
                $element.StringConstantType -ne [StringConstantType]::BareWord -or
                $element.Value.StartsWith('-') -or
                $element.Value -eq $wordToComplete) {
                break
        }
        $element.Value
    }) -join ';'

    $completions = @(switch ($command) {
        'deno' {
            [CompletionResult]::new('-L', 'L', [CompletionResultType]::ParameterName, 'Set log level')
            [CompletionResult]::new('--log-level', 'log-level', [CompletionResultType]::ParameterName, 'Set log level')
            [CompletionResult]::new('--unstable', 'unstable', [CompletionResultType]::ParameterName, 'Enable unstable features and APIs')
            [CompletionResult]::new('-q', 'q', [CompletionResultType]::ParameterName, 'Suppress diagnostic output')
            [CompletionResult]::new('--quiet', 'quiet', [CompletionResultType]::ParameterName, 'Suppress diagnostic output')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('run', 'run', [CompletionResultType]::ParameterValue, 'Run a JavaScript or TypeScript program')
            [CompletionResult]::new('bench', 'bench', [CompletionResultType]::ParameterValue, 'Run benchmarks')
            [CompletionResult]::new('bundle', 'bundle', [CompletionResultType]::ParameterValue, 'Bundle module and dependencies into single file')
            [CompletionResult]::new('cache', 'cache', [CompletionResultType]::ParameterValue, 'Cache the dependencies')
            [CompletionResult]::new('check', 'check', [CompletionResultType]::ParameterValue, 'Type-check the dependencies')
            [CompletionResult]::new('compile', 'compile', [CompletionResultType]::ParameterValue, 'UNSTABLE: Compile the script into a self contained executable')
            [CompletionResult]::new('completions', 'completions', [CompletionResultType]::ParameterValue, 'Generate shell completions')
            [CompletionResult]::new('coverage', 'coverage', [CompletionResultType]::ParameterValue, 'Print coverage reports')
            [CompletionResult]::new('doc', 'doc', [CompletionResultType]::ParameterValue, 'Show documentation for a module')
            [CompletionResult]::new('eval', 'eval', [CompletionResultType]::ParameterValue, 'Eval script')
            [CompletionResult]::new('fmt', 'fmt', [CompletionResultType]::ParameterValue, 'Format source files')
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initialize a new project')
            [CompletionResult]::new('info', 'info', [CompletionResultType]::ParameterValue, 'Show info about cache or info related to source file')
            [CompletionResult]::new('install', 'install', [CompletionResultType]::ParameterValue, 'Install script as an executable')
            [CompletionResult]::new('uninstall', 'uninstall', [CompletionResultType]::ParameterValue, 'Uninstall a script previously installed with deno install')
            [CompletionResult]::new('lsp', 'lsp', [CompletionResultType]::ParameterValue, 'Start the language server')
            [CompletionResult]::new('lint', 'lint', [CompletionResultType]::ParameterValue, 'Lint source files')
            [CompletionResult]::new('repl', 'repl', [CompletionResultType]::ParameterValue, 'Read Eval Print Loop')
            [CompletionResult]::new('task', 'task', [CompletionResultType]::ParameterValue, 'Run a task defined in the configuration file')
            [CompletionResult]::new('test', 'test', [CompletionResultType]::ParameterValue, 'Run tests')
            [CompletionResult]::new('types', 'types', [CompletionResultType]::ParameterValue, 'Print runtime TypeScript declarations')
            [CompletionResult]::new('upgrade', 'upgrade', [CompletionResultType]::ParameterValue, 'Upgrade deno executable to given version')
            [CompletionResult]::new('vendor', 'vendor', [CompletionResultType]::ParameterValue, 'Vendor remote modules into a local directory')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'deno;run' {
            [CompletionResult]::new('--no-check', 'no-check', [CompletionResultType]::ParameterName, 'Skip type-checking modules')
            [CompletionResult]::new('--import-map', 'import-map', [CompletionResultType]::ParameterName, 'Load import map file')
            [CompletionResult]::new('--node-modules-dir', 'node-modules-dir', [CompletionResultType]::ParameterName, 'Enables or disables the use of a local node_modules folder for npm packages')
            [CompletionResult]::new('-c', 'c', [CompletionResultType]::ParameterName, 'Specify the configuration file')
            [CompletionResult]::new('--config', 'config', [CompletionResultType]::ParameterName, 'Specify the configuration file')
            [CompletionResult]::new('-r', 'r', [CompletionResultType]::ParameterName, 'Reload source code cache (recompile TypeScript)')
            [CompletionResult]::new('--reload', 'reload', [CompletionResultType]::ParameterName, 'Reload source code cache (recompile TypeScript)')
            [CompletionResult]::new('--lock', 'lock', [CompletionResultType]::ParameterName, 'Check the specified lock file.

If value is not provided, defaults to "deno.lock" in the current working directory.')
            [CompletionResult]::new('--cert', 'cert', [CompletionResultType]::ParameterName, 'Load certificate authority from PEM encoded file')
            [CompletionResult]::new('--allow-read', 'allow-read', [CompletionResultType]::ParameterName, 'Allow file system read access. Optionally specify allowed paths.
Docs: https://deno.land/manual@v1.34.3/basics/permissions
Examples:
  --allow-read
  --allow-read="/etc,/var/log.txt"')
            [CompletionResult]::new('--allow-write', 'allow-write', [CompletionResultType]::ParameterName, 'Allow file system write access. Optionally specify allowed paths.
Docs: https://deno.land/manual@v1.34.3/basics/permissions
Examples:
  --allow-write
  --allow-write="/etc,/var/log.txt"')
            [CompletionResult]::new('--allow-net', 'allow-net', [CompletionResultType]::ParameterName, 'Allow network access. Optionally specify allowed IP addresses and host names, with ports as necessary.
Docs: https://deno.land/manual@v1.34.3/basics/permissions
Examples:
  --allow-net
  --allow-net="localhost:8080,deno.land"')
            [CompletionResult]::new('--unsafely-ignore-certificate-errors', 'unsafely-ignore-certificate-errors', [CompletionResultType]::ParameterName, 'DANGER: Disables verification of TLS certificates')
            [CompletionResult]::new('--allow-env', 'allow-env', [CompletionResultType]::ParameterName, 'Allow access to system environment information. Optionally specify accessible environment variables.
Docs: https://deno.land/manual@v1.34.3/basics/permissions
Examples:
  --allow-env
  --allow-env="PORT,HOME,PATH"')
            [CompletionResult]::new('--allow-sys', 'allow-sys', [CompletionResultType]::ParameterName, 'Allow access to OS information. Optionally allow specific APIs by function name.
Docs: https://deno.land/manual@v1.34.3/basics/permissions
Examples:
  --allow-sys
  --allow-sys="systemMemoryInfo,osRelease"')
            [CompletionResult]::new('--allow-run', 'allow-run', [CompletionResultType]::ParameterName, 'Allow running subprocesses. Optionally specify allowed runnable program names.
Docs: https://deno.land/manual@v1.34.3/basics/permissions
Examples:
  --allow-run
  --allow-run="whoami,ps"')
            [CompletionResult]::new('--allow-ffi', 'allow-ffi', [CompletionResultType]::ParameterName, '(Unstable) Allow loading dynamic libraries. Optionally specify allowed directories or files.
Docs: https://deno.land/manual@v1.34.3/basics/permissions
Examples:
  --allow-ffi
  --allow-ffi="./libfoo.so"')
            [CompletionResult]::new('--inspect', 'inspect', [CompletionResultType]::ParameterName, 'Activate inspector on host:port (default: 127.0.0.1:9229)')
            [CompletionResult]::new('--inspect-brk', 'inspect-brk', [CompletionResultType]::ParameterName, 'Activate inspector on host:port, wait for debugger to connect and break at the start of user script')
            [CompletionResult]::new('--inspect-wait', 'inspect-wait', [CompletionResultType]::ParameterName, 'Activate inspector on host:port and wait for debugger to connect before running user code')
            [CompletionResult]::new('--location', 'location', [CompletionResultType]::ParameterName, 'Value of ''globalThis.location'' used by some web APIs')
            [CompletionResult]::new('--v8-flags', 'v8-flags', [CompletionResultType]::ParameterName, 'Set V8 command line options')
            [CompletionResult]::new('--seed', 'seed', [CompletionResultType]::ParameterName, 'Set the random number generator seed')
            [CompletionResult]::new('--check', 'check', [CompletionResultType]::ParameterName, 'Type-check modules')
            [CompletionResult]::new('--watch', 'watch', [CompletionResultType]::ParameterName, 'Watch for file changes and restart automatically')
            [CompletionResult]::new('--ext', 'ext', [CompletionResultType]::ParameterName, 'Set content type of the supplied file')
            [CompletionResult]::new('-L', 'L', [CompletionResultType]::ParameterName, 'Set log level')
            [CompletionResult]::new('--log-level', 'log-level', [CompletionResultType]::ParameterName, 'Set log level')
            [CompletionResult]::new('--no-remote', 'no-remote', [CompletionResultType]::ParameterName, 'Do not resolve remote modules')
            [CompletionResult]::new('--no-npm', 'no-npm', [CompletionResultType]::ParameterName, 'Do not resolve npm modules')
            [CompletionResult]::new('--no-config', 'no-config', [CompletionResultType]::ParameterName, 'Disable automatic loading of the configuration file.')
            [CompletionResult]::new('--lock-write', 'lock-write', [CompletionResultType]::ParameterName, 'Force overwriting the lock file.')
            [CompletionResult]::new('--no-lock', 'no-lock', [CompletionResultType]::ParameterName, 'Disable auto discovery of the lock file.')
            [CompletionResult]::new('--allow-hrtime', 'allow-hrtime', [CompletionResultType]::ParameterName, 'Allow high-resolution time measurement. Note: this can enable timing attacks and fingerprinting.
Docs: https://deno.land/manual@v1.34.3/basics/permissions
')
            [CompletionResult]::new('-A', 'A', [CompletionResultType]::ParameterName, 'Allow all permissions. Learn more about permissions in Deno:
https://deno.land/manual@v1.34.3/basics/permissions
')
            [CompletionResult]::new('--allow-all', 'allow-all', [CompletionResultType]::ParameterName, 'Allow all permissions. Learn more about permissions in Deno:
https://deno.land/manual@v1.34.3/basics/permissions
')
            [CompletionResult]::new('--prompt', 'prompt', [CompletionResultType]::ParameterName, 'deprecated: Fallback to prompt if required permission wasn''t passed')
            [CompletionResult]::new('--no-prompt', 'no-prompt', [CompletionResultType]::ParameterName, 'Always throw if required permission wasn''t passed')
            [CompletionResult]::new('--cached-only', 'cached-only', [CompletionResultType]::ParameterName, 'Require that remote dependencies are already cached')
            [CompletionResult]::new('--enable-testing-features-do-not-use', 'enable-testing-features-do-not-use', [CompletionResultType]::ParameterName, 'INTERNAL: Enable internal features used during integration testing')
            [CompletionResult]::new('--no-clear-screen', 'no-clear-screen', [CompletionResultType]::ParameterName, 'Do not clear terminal screen when under watch mode')
            [CompletionResult]::new('--unstable', 'unstable', [CompletionResultType]::ParameterName, 'Enable unstable features and APIs')
            [CompletionResult]::new('-q', 'q', [CompletionResultType]::ParameterName, 'Suppress diagnostic output')
            [CompletionResult]::new('--quiet', 'quiet', [CompletionResultType]::ParameterName, 'Suppress diagnostic output')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'deno;bench' {
            [CompletionResult]::new('-L', 'L', [CompletionResultType]::ParameterName, 'Set log level')
            [CompletionResult]::new('--log-level', 'log-level', [CompletionResultType]::ParameterName, 'Set log level')
            [CompletionResult]::new('--no-check', 'no-check', [CompletionResultType]::ParameterName, 'Skip type-checking modules')
            [CompletionResult]::new('--import-map', 'import-map', [CompletionResultType]::ParameterName, 'Load import map file')
            [CompletionResult]::new('--node-modules-dir', 'node-modules-dir', [CompletionResultType]::ParameterName, 'Enables or disables the use of a local node_modules folder for npm packages')
            [CompletionResult]::new('-c', 'c', [CompletionResultType]::ParameterName, 'Specify the configuration file')
            [CompletionResult]::new('--config', 'config', [CompletionResultType]::ParameterName, 'Specify the configuration file')
            [CompletionResult]::new('-r', 'r', [CompletionResultType]::ParameterName, 'Reload source code cache (recompile TypeScript)')
            [CompletionResult]::new('--reload', 'reload', [CompletionResultType]::ParameterName, 'Reload source code cache (recompile TypeScript)')
            [CompletionResult]::new('--lock', 'lock', [CompletionResultType]::ParameterName, 'Check the specified lock file.

If value is not provided, defaults to "deno.lock" in the current working directory.')
            [CompletionResult]::new('--cert', 'cert', [CompletionResultType]::ParameterName, 'Load certificate authority from PEM encoded file')
            [CompletionResult]::new('--allow-read', 'allow-read', [CompletionResultType]::ParameterName, 'Allow file system read access. Optionally specify allowed paths.
Docs: https://deno.land/manual@v1.34.3/basics/permissions
Examples:
  --allow-read
  --allow-read="/etc,/var/log.txt"')
            [CompletionResult]::new('--allow-write', 'allow-write', [CompletionResultType]::ParameterName, 'Allow file system write access. Optionally specify allowed paths.
Docs: https://deno.land/manual@v1.34.3/basics/permissions
Examples:
  --allow-write
  --allow-write="/etc,/var/log.txt"')
            [CompletionResult]::new('--allow-net', 'allow-net', [CompletionResultType]::ParameterName, 'Allow network access. Optionally specify allowed IP addresses and host names, with ports as necessary.
Docs: https://deno.land/manual@v1.34.3/basics/permissions
Examples:
  --allow-net
  --allow-net="localhost:8080,deno.land"')
            [CompletionResult]::new('--unsafely-ignore-certificate-errors', 'unsafely-ignore-certificate-errors', [CompletionResultType]::ParameterName, 'DANGER: Disables verification of TLS certificates')
            [CompletionResult]::new('--allow-env', 'allow-env', [CompletionResultType]::ParameterName, 'Allow access to system environment information. Optionally specify accessible environment variables.
Docs: https://deno.land/manual@v1.34.3/basics/permissions
Examples:
  --allow-env
  --allow-env="PORT,HOME,PATH"')
            [CompletionResult]::new('--allow-sys', 'allow-sys', [CompletionResultType]::ParameterName, 'Allow access to OS information. Optionally allow specific APIs by function name.
Docs: https://deno.land/manual@v1.34.3/basics/permissions
Examples:
  --allow-sys
  --allow-sys="systemMemoryInfo,osRelease"')
            [CompletionResult]::new('--allow-run', 'allow-run', [CompletionResultType]::ParameterName, 'Allow running subprocesses. Optionally specify allowed runnable program names.
Docs: https://deno.land/manual@v1.34.3/basics/permissions
Examples:
  --allow-run
  --allow-run="whoami,ps"')
            [CompletionResult]::new('--allow-ffi', 'allow-ffi', [CompletionResultType]::ParameterName, '(Unstable) Allow loading dynamic libraries. Optionally specify allowed directories or files.
Docs: https://deno.land/manual@v1.34.3/basics/permissions
Examples:
  --allow-ffi
  --allow-ffi="./libfoo.so"')
            [CompletionResult]::new('--location', 'location', [CompletionResultType]::ParameterName, 'Value of ''globalThis.location'' used by some web APIs')
            [CompletionResult]::new('--v8-flags', 'v8-flags', [CompletionResultType]::ParameterName, 'Set V8 command line options')
            [CompletionResult]::new('--seed', 'seed', [CompletionResultType]::ParameterName, 'Set the random number generator seed')
            [CompletionResult]::new('--check', 'check', [CompletionResultType]::ParameterName, 'Type-check modules')
            [CompletionResult]::new('--ignore', 'ignore', [CompletionResultType]::ParameterName, 'Ignore files')
            [CompletionResult]::new('--filter', 'filter', [CompletionResultType]::ParameterName, 'Run benchmarks with this string or pattern in the bench name')
            [CompletionResult]::new('--unstable', 'unstable', [CompletionResultType]::ParameterName, 'Enable unstable features and APIs')
            [CompletionResult]::new('-q', 'q', [CompletionResultType]::ParameterName, 'Suppress diagnostic output')
            [CompletionResult]::new('--quiet', 'quiet', [CompletionResultType]::ParameterName, 'Suppress diagnostic output')
            [CompletionResult]::new('--no-remote', 'no-remote', [CompletionResultType]::ParameterName, 'Do not resolve remote modules')
            [CompletionResult]::new('--no-npm', 'no-npm', [CompletionResultType]::ParameterName, 'Do not resolve npm modules')
            [CompletionResult]::new('--no-config', 'no-config', [CompletionResultType]::ParameterName, 'Disable automatic loading of the configuration file.')
            [CompletionResult]::new('--lock-write', 'lock-write', [CompletionResultType]::ParameterName, 'Force overwriting the lock file.')
            [CompletionResult]::new('--no-lock', 'no-lock', [CompletionResultType]::ParameterName, 'Disable auto discovery of the lock file.')
            [CompletionResult]::new('--allow-hrtime', 'allow-hrtime', [CompletionResultType]::ParameterName, 'Allow high-resolution time measurement. Note: this can enable timing attacks and fingerprinting.
Docs: https://deno.land/manual@v1.34.3/basics/permissions
')
            [CompletionResult]::new('-A', 'A', [CompletionResultType]::ParameterName, 'Allow all permissions. Learn more about permissions in Deno:
https://deno.land/manual@v1.34.3/basics/permissions
')
            [CompletionResult]::new('--allow-all', 'allow-all', [CompletionResultType]::ParameterName, 'Allow all permissions. Learn more about permissions in Deno:
https://deno.land/manual@v1.34.3/basics/permissions
')
            [CompletionResult]::new('--prompt', 'prompt', [CompletionResultType]::ParameterName, 'deprecated: Fallback to prompt if required permission wasn''t passed')
            [CompletionResult]::new('--no-prompt', 'no-prompt', [CompletionResultType]::ParameterName, 'Always throw if required permission wasn''t passed')
            [CompletionResult]::new('--cached-only', 'cached-only', [CompletionResultType]::ParameterName, 'Require that remote dependencies are already cached')
            [CompletionResult]::new('--enable-testing-features-do-not-use', 'enable-testing-features-do-not-use', [CompletionResultType]::ParameterName, 'INTERNAL: Enable internal features used during integration testing')
            [CompletionResult]::new('--json', 'json', [CompletionResultType]::ParameterName, 'UNSTABLE: Output benchmark result in JSON format')
            [CompletionResult]::new('--no-run', 'no-run', [CompletionResultType]::ParameterName, 'Cache bench modules, but don''t run benchmarks')
            [CompletionResult]::new('--watch', 'watch', [CompletionResultType]::ParameterName, 'Watch for file changes and restart automatically')
            [CompletionResult]::new('--no-clear-screen', 'no-clear-screen', [CompletionResultType]::ParameterName, 'Do not clear terminal screen when under watch mode')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'deno;bundle' {
            [CompletionResult]::new('-L', 'L', [CompletionResultType]::ParameterName, 'Set log level')
            [CompletionResult]::new('--log-level', 'log-level', [CompletionResultType]::ParameterName, 'Set log level')
            [CompletionResult]::new('--no-check', 'no-check', [CompletionResultType]::ParameterName, 'Skip type-checking modules')
            [CompletionResult]::new('--import-map', 'import-map', [CompletionResultType]::ParameterName, 'Load import map file')
            [CompletionResult]::new('--node-modules-dir', 'node-modules-dir', [CompletionResultType]::ParameterName, 'Enables or disables the use of a local node_modules folder for npm packages')
            [CompletionResult]::new('-c', 'c', [CompletionResultType]::ParameterName, 'Specify the configuration file')
            [CompletionResult]::new('--config', 'config', [CompletionResultType]::ParameterName, 'Specify the configuration file')
            [CompletionResult]::new('-r', 'r', [CompletionResultType]::ParameterName, 'Reload source code cache (recompile TypeScript)')
            [CompletionResult]::new('--reload', 'reload', [CompletionResultType]::ParameterName, 'Reload source code cache (recompile TypeScript)')
            [CompletionResult]::new('--lock', 'lock', [CompletionResultType]::ParameterName, 'Check the specified lock file.

If value is not provided, defaults to "deno.lock" in the current working directory.')
            [CompletionResult]::new('--cert', 'cert', [CompletionResultType]::ParameterName, 'Load certificate authority from PEM encoded file')
            [CompletionResult]::new('--check', 'check', [CompletionResultType]::ParameterName, 'Type-check modules')
            [CompletionResult]::new('--ext', 'ext', [CompletionResultType]::ParameterName, 'Set content type of the supplied file')
            [CompletionResult]::new('--unstable', 'unstable', [CompletionResultType]::ParameterName, 'Enable unstable features and APIs')
            [CompletionResult]::new('-q', 'q', [CompletionResultType]::ParameterName, 'Suppress diagnostic output')
            [CompletionResult]::new('--quiet', 'quiet', [CompletionResultType]::ParameterName, 'Suppress diagnostic output')
            [CompletionResult]::new('--no-remote', 'no-remote', [CompletionResultType]::ParameterName, 'Do not resolve remote modules')
            [CompletionResult]::new('--no-npm', 'no-npm', [CompletionResultType]::ParameterName, 'Do not resolve npm modules')
            [CompletionResult]::new('--no-config', 'no-config', [CompletionResultType]::ParameterName, 'Disable automatic loading of the configuration file.')
            [CompletionResult]::new('--lock-write', 'lock-write', [CompletionResultType]::ParameterName, 'Force overwriting the lock file.')
            [CompletionResult]::new('--no-lock', 'no-lock', [CompletionResultType]::ParameterName, 'Disable auto discovery of the lock file.')
            [CompletionResult]::new('--watch', 'watch', [CompletionResultType]::ParameterName, 'Watch for file changes and restart automatically')
            [CompletionResult]::new('--no-clear-screen', 'no-clear-screen', [CompletionResultType]::ParameterName, 'Do not clear terminal screen when under watch mode')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'deno;cache' {
            [CompletionResult]::new('-L', 'L', [CompletionResultType]::ParameterName, 'Set log level')
            [CompletionResult]::new('--log-level', 'log-level', [CompletionResultType]::ParameterName, 'Set log level')
            [CompletionResult]::new('--no-check', 'no-check', [CompletionResultType]::ParameterName, 'Skip type-checking modules')
            [CompletionResult]::new('--import-map', 'import-map', [CompletionResultType]::ParameterName, 'Load import map file')
            [CompletionResult]::new('--node-modules-dir', 'node-modules-dir', [CompletionResultType]::ParameterName, 'Enables or disables the use of a local node_modules folder for npm packages')
            [CompletionResult]::new('-c', 'c', [CompletionResultType]::ParameterName, 'Specify the configuration file')
            [CompletionResult]::new('--config', 'config', [CompletionResultType]::ParameterName, 'Specify the configuration file')
            [CompletionResult]::new('-r', 'r', [CompletionResultType]::ParameterName, 'Reload source code cache (recompile TypeScript)')
            [CompletionResult]::new('--reload', 'reload', [CompletionResultType]::ParameterName, 'Reload source code cache (recompile TypeScript)')
            [CompletionResult]::new('--lock', 'lock', [CompletionResultType]::ParameterName, 'Check the specified lock file.

If value is not provided, defaults to "deno.lock" in the current working directory.')
            [CompletionResult]::new('--cert', 'cert', [CompletionResultType]::ParameterName, 'Load certificate authority from PEM encoded file')
            [CompletionResult]::new('--check', 'check', [CompletionResultType]::ParameterName, 'Type-check modules')
            [CompletionResult]::new('--unstable', 'unstable', [CompletionResultType]::ParameterName, 'Enable unstable features and APIs')
            [CompletionResult]::new('-q', 'q', [CompletionResultType]::ParameterName, 'Suppress diagnostic output')
            [CompletionResult]::new('--quiet', 'quiet', [CompletionResultType]::ParameterName, 'Suppress diagnostic output')
            [CompletionResult]::new('--no-remote', 'no-remote', [CompletionResultType]::ParameterName, 'Do not resolve remote modules')
            [CompletionResult]::new('--no-npm', 'no-npm', [CompletionResultType]::ParameterName, 'Do not resolve npm modules')
            [CompletionResult]::new('--no-config', 'no-config', [CompletionResultType]::ParameterName, 'Disable automatic loading of the configuration file.')
            [CompletionResult]::new('--lock-write', 'lock-write', [CompletionResultType]::ParameterName, 'Force overwriting the lock file.')
            [CompletionResult]::new('--no-lock', 'no-lock', [CompletionResultType]::ParameterName, 'Disable auto discovery of the lock file.')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'deno;check' {
            [CompletionResult]::new('-L', 'L', [CompletionResultType]::ParameterName, 'Set log level')
            [CompletionResult]::new('--log-level', 'log-level', [CompletionResultType]::ParameterName, 'Set log level')
            [CompletionResult]::new('--import-map', 'import-map', [CompletionResultType]::ParameterName, 'Load import map file')
            [CompletionResult]::new('--node-modules-dir', 'node-modules-dir', [CompletionResultType]::ParameterName, 'Enables or disables the use of a local node_modules folder for npm packages')
            [CompletionResult]::new('-c', 'c', [CompletionResultType]::ParameterName, 'Specify the configuration file')
            [CompletionResult]::new('--config', 'config', [CompletionResultType]::ParameterName, 'Specify the configuration file')
            [CompletionResult]::new('-r', 'r', [CompletionResultType]::ParameterName, 'Reload source code cache (recompile TypeScript)')
            [CompletionResult]::new('--reload', 'reload', [CompletionResultType]::ParameterName, 'Reload source code cache (recompile TypeScript)')
            [CompletionResult]::new('--lock', 'lock', [CompletionResultType]::ParameterName, 'Check the specified lock file.

If value is not provided, defaults to "deno.lock" in the current working directory.')
            [CompletionResult]::new('--cert', 'cert', [CompletionResultType]::ParameterName, 'Load certificate authority from PEM encoded file')
            [CompletionResult]::new('--unstable', 'unstable', [CompletionResultType]::ParameterName, 'Enable unstable features and APIs')
            [CompletionResult]::new('-q', 'q', [CompletionResultType]::ParameterName, 'Suppress diagnostic output')
            [CompletionResult]::new('--quiet', 'quiet', [CompletionResultType]::ParameterName, 'Suppress diagnostic output')
            [CompletionResult]::new('--no-remote', 'no-remote', [CompletionResultType]::ParameterName, 'Do not resolve remote modules')
            [CompletionResult]::new('--no-npm', 'no-npm', [CompletionResultType]::ParameterName, 'Do not resolve npm modules')
            [CompletionResult]::new('--no-config', 'no-config', [CompletionResultType]::ParameterName, 'Disable automatic loading of the configuration file.')
            [CompletionResult]::new('--lock-write', 'lock-write', [CompletionResultType]::ParameterName, 'Force overwriting the lock file.')
            [CompletionResult]::new('--no-lock', 'no-lock', [CompletionResultType]::ParameterName, 'Disable auto discovery of the lock file.')
            [CompletionResult]::new('--all', 'all', [CompletionResultType]::ParameterName, 'Type-check all code, including remote modules and npm packages')
            [CompletionResult]::new('--remote', 'remote', [CompletionResultType]::ParameterName, 'Type-check all modules, including remote')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'deno;compile' {
            [CompletionResult]::new('-L', 'L', [CompletionResultType]::ParameterName, 'Set log level')
            [CompletionResult]::new('--log-level', 'log-level', [CompletionResultType]::ParameterName, 'Set log level')
            [CompletionResult]::new('--no-check', 'no-check', [CompletionResultType]::ParameterName, 'Skip type-checking modules')
            [CompletionResult]::new('--import-map', 'import-map', [CompletionResultType]::ParameterName, 'Load import map file')
            [CompletionResult]::new('--node-modules-dir', 'node-modules-dir', [CompletionResultType]::ParameterName, 'Enables or disables the use of a local node_modules folder for npm packages')
            [CompletionResult]::new('-c', 'c', [CompletionResultType]::ParameterName, 'Specify the configuration file')
            [CompletionResult]::new('--config', 'config', [CompletionResultType]::ParameterName, 'Specify the configuration file')
            [CompletionResult]::new('-r', 'r', [CompletionResultType]::ParameterName, 'Reload source code cache (recompile TypeScript)')
            [CompletionResult]::new('--reload', 'reload', [CompletionResultType]::ParameterName, 'Reload source code cache (recompile TypeScript)')
            [CompletionResult]::new('--lock', 'lock', [CompletionResultType]::ParameterName, 'Check the specified lock file.

If value is not provided, defaults to "deno.lock" in the current working directory.')
            [CompletionResult]::new('--cert', 'cert', [CompletionResultType]::ParameterName, 'Load certificate authority from PEM encoded file')
            [CompletionResult]::new('--allow-read', 'allow-read', [CompletionResultType]::ParameterName, 'Allow file system read access. Optionally specify allowed paths.
Docs: https://deno.land/manual@v1.34.3/basics/permissions
Examples:
  --allow-read
  --allow-read="/etc,/var/log.txt"')
            [CompletionResult]::new('--allow-write', 'allow-write', [CompletionResultType]::ParameterName, 'Allow file system write access. Optionally specify allowed paths.
Docs: https://deno.land/manual@v1.34.3/basics/permissions
Examples:
  --allow-write
  --allow-write="/etc,/var/log.txt"')
            [CompletionResult]::new('--allow-net', 'allow-net', [CompletionResultType]::ParameterName, 'Allow network access. Optionally specify allowed IP addresses and host names, with ports as necessary.
Docs: https://deno.land/manual@v1.34.3/basics/permissions
Examples:
  --allow-net
  --allow-net="localhost:8080,deno.land"')
            [CompletionResult]::new('--unsafely-ignore-certificate-errors', 'unsafely-ignore-certificate-errors', [CompletionResultType]::ParameterName, 'DANGER: Disables verification of TLS certificates')
            [CompletionResult]::new('--allow-env', 'allow-env', [CompletionResultType]::ParameterName, 'Allow access to system environment information. Optionally specify accessible environment variables.
Docs: https://deno.land/manual@v1.34.3/basics/permissions
Examples:
  --allow-env
  --allow-env="PORT,HOME,PATH"')
            [CompletionResult]::new('--allow-sys', 'allow-sys', [CompletionResultType]::ParameterName, 'Allow access to OS information. Optionally allow specific APIs by function name.
Docs: https://deno.land/manual@v1.34.3/basics/permissions
Examples:
  --allow-sys
  --allow-sys="systemMemoryInfo,osRelease"')
            [CompletionResult]::new('--allow-run', 'allow-run', [CompletionResultType]::ParameterName, 'Allow running subprocesses. Optionally specify allowed runnable program names.
Docs: https://deno.land/manual@v1.34.3/basics/permissions
Examples:
  --allow-run
  --allow-run="whoami,ps"')
            [CompletionResult]::new('--allow-ffi', 'allow-ffi', [CompletionResultType]::ParameterName, '(Unstable) Allow loading dynamic libraries. Optionally specify allowed directories or files.
Docs: https://deno.land/manual@v1.34.3/basics/permissions
Examples:
  --allow-ffi
  --allow-ffi="./libfoo.so"')
            [CompletionResult]::new('--location', 'location', [CompletionResultType]::ParameterName, 'Value of ''globalThis.location'' used by some web APIs')
            [CompletionResult]::new('--v8-flags', 'v8-flags', [CompletionResultType]::ParameterName, 'Set V8 command line options')
            [CompletionResult]::new('--seed', 'seed', [CompletionResultType]::ParameterName, 'Set the random number generator seed')
            [CompletionResult]::new('--check', 'check', [CompletionResultType]::ParameterName, 'Type-check modules')
            [CompletionResult]::new('--include', 'include', [CompletionResultType]::ParameterName, 'UNSTABLE: Additional module to include in the module graph')
            [CompletionResult]::new('-o', 'o', [CompletionResultType]::ParameterName, 'Output file (defaults to $PWD/<inferred-name>)')
            [CompletionResult]::new('--output', 'output', [CompletionResultType]::ParameterName, 'Output file (defaults to $PWD/<inferred-name>)')
            [CompletionResult]::new('--target', 'target', [CompletionResultType]::ParameterName, 'Target OS architecture')
            [CompletionResult]::new('--ext', 'ext', [CompletionResultType]::ParameterName, 'Set content type of the supplied file')
            [CompletionResult]::new('--unstable', 'unstable', [CompletionResultType]::ParameterName, 'Enable unstable features and APIs')
            [CompletionResult]::new('-q', 'q', [CompletionResultType]::ParameterName, 'Suppress diagnostic output')
            [CompletionResult]::new('--quiet', 'quiet', [CompletionResultType]::ParameterName, 'Suppress diagnostic output')
            [CompletionResult]::new('--no-remote', 'no-remote', [CompletionResultType]::ParameterName, 'Do not resolve remote modules')
            [CompletionResult]::new('--no-npm', 'no-npm', [CompletionResultType]::ParameterName, 'Do not resolve npm modules')
            [CompletionResult]::new('--no-config', 'no-config', [CompletionResultType]::ParameterName, 'Disable automatic loading of the configuration file.')
            [CompletionResult]::new('--lock-write', 'lock-write', [CompletionResultType]::ParameterName, 'Force overwriting the lock file.')
            [CompletionResult]::new('--no-lock', 'no-lock', [CompletionResultType]::ParameterName, 'Disable auto discovery of the lock file.')
            [CompletionResult]::new('--allow-hrtime', 'allow-hrtime', [CompletionResultType]::ParameterName, 'Allow high-resolution time measurement. Note: this can enable timing attacks and fingerprinting.
Docs: https://deno.land/manual@v1.34.3/basics/permissions
')
            [CompletionResult]::new('-A', 'A', [CompletionResultType]::ParameterName, 'Allow all permissions. Learn more about permissions in Deno:
https://deno.land/manual@v1.34.3/basics/permissions
')
            [CompletionResult]::new('--allow-all', 'allow-all', [CompletionResultType]::ParameterName, 'Allow all permissions. Learn more about permissions in Deno:
https://deno.land/manual@v1.34.3/basics/permissions
')
            [CompletionResult]::new('--prompt', 'prompt', [CompletionResultType]::ParameterName, 'deprecated: Fallback to prompt if required permission wasn''t passed')
            [CompletionResult]::new('--no-prompt', 'no-prompt', [CompletionResultType]::ParameterName, 'Always throw if required permission wasn''t passed')
            [CompletionResult]::new('--cached-only', 'cached-only', [CompletionResultType]::ParameterName, 'Require that remote dependencies are already cached')
            [CompletionResult]::new('--enable-testing-features-do-not-use', 'enable-testing-features-do-not-use', [CompletionResultType]::ParameterName, 'INTERNAL: Enable internal features used during integration testing')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'deno;completions' {
            [CompletionResult]::new('-L', 'L', [CompletionResultType]::ParameterName, 'Set log level')
            [CompletionResult]::new('--log-level', 'log-level', [CompletionResultType]::ParameterName, 'Set log level')
            [CompletionResult]::new('--unstable', 'unstable', [CompletionResultType]::ParameterName, 'Enable unstable features and APIs')
            [CompletionResult]::new('-q', 'q', [CompletionResultType]::ParameterName, 'Suppress diagnostic output')
            [CompletionResult]::new('--quiet', 'quiet', [CompletionResultType]::ParameterName, 'Suppress diagnostic output')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'deno;coverage' {
            [CompletionResult]::new('-L', 'L', [CompletionResultType]::ParameterName, 'Set log level')
            [CompletionResult]::new('--log-level', 'log-level', [CompletionResultType]::ParameterName, 'Set log level')
            [CompletionResult]::new('--ignore', 'ignore', [CompletionResultType]::ParameterName, 'Ignore coverage files')
            [CompletionResult]::new('--include', 'include', [CompletionResultType]::ParameterName, 'Include source files in the report')
            [CompletionResult]::new('--exclude', 'exclude', [CompletionResultType]::ParameterName, 'Exclude source files from the report')
            [CompletionResult]::new('--output', 'output', [CompletionResultType]::ParameterName, 'Output file (defaults to stdout) for lcov')
            [CompletionResult]::new('--unstable', 'unstable', [CompletionResultType]::ParameterName, 'Enable unstable features and APIs')
            [CompletionResult]::new('-q', 'q', [CompletionResultType]::ParameterName, 'Suppress diagnostic output')
            [CompletionResult]::new('--quiet', 'quiet', [CompletionResultType]::ParameterName, 'Suppress diagnostic output')
            [CompletionResult]::new('--lcov', 'lcov', [CompletionResultType]::ParameterName, 'Output coverage report in lcov format')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'deno;doc' {
            [CompletionResult]::new('-L', 'L', [CompletionResultType]::ParameterName, 'Set log level')
            [CompletionResult]::new('--log-level', 'log-level', [CompletionResultType]::ParameterName, 'Set log level')
            [CompletionResult]::new('--import-map', 'import-map', [CompletionResultType]::ParameterName, 'Load import map file')
            [CompletionResult]::new('-r', 'r', [CompletionResultType]::ParameterName, 'Reload source code cache (recompile TypeScript)')
            [CompletionResult]::new('--reload', 'reload', [CompletionResultType]::ParameterName, 'Reload source code cache (recompile TypeScript)')
            [CompletionResult]::new('--lock', 'lock', [CompletionResultType]::ParameterName, 'Check the specified lock file.

If value is not provided, defaults to "deno.lock" in the current working directory.')
            [CompletionResult]::new('--unstable', 'unstable', [CompletionResultType]::ParameterName, 'Enable unstable features and APIs')
            [CompletionResult]::new('-q', 'q', [CompletionResultType]::ParameterName, 'Suppress diagnostic output')
            [CompletionResult]::new('--quiet', 'quiet', [CompletionResultType]::ParameterName, 'Suppress diagnostic output')
            [CompletionResult]::new('--no-lock', 'no-lock', [CompletionResultType]::ParameterName, 'Disable auto discovery of the lock file.')
            [CompletionResult]::new('--no-npm', 'no-npm', [CompletionResultType]::ParameterName, 'Do not resolve npm modules')
            [CompletionResult]::new('--no-remote', 'no-remote', [CompletionResultType]::ParameterName, 'Do not resolve remote modules')
            [CompletionResult]::new('--json', 'json', [CompletionResultType]::ParameterName, 'Output documentation in JSON format')
            [CompletionResult]::new('--private', 'private', [CompletionResultType]::ParameterName, 'Output private documentation')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'deno;eval' {
            [CompletionResult]::new('-L', 'L', [CompletionResultType]::ParameterName, 'Set log level')
            [CompletionResult]::new('--log-level', 'log-level', [CompletionResultType]::ParameterName, 'Set log level')
            [CompletionResult]::new('--no-check', 'no-check', [CompletionResultType]::ParameterName, 'Skip type-checking modules')
            [CompletionResult]::new('--import-map', 'import-map', [CompletionResultType]::ParameterName, 'Load import map file')
            [CompletionResult]::new('--node-modules-dir', 'node-modules-dir', [CompletionResultType]::ParameterName, 'Enables or disables the use of a local node_modules folder for npm packages')
            [CompletionResult]::new('-c', 'c', [CompletionResultType]::ParameterName, 'Specify the configuration file')
            [CompletionResult]::new('--config', 'config', [CompletionResultType]::ParameterName, 'Specify the configuration file')
            [CompletionResult]::new('-r', 'r', [CompletionResultType]::ParameterName, 'Reload source code cache (recompile TypeScript)')
            [CompletionResult]::new('--reload', 'reload', [CompletionResultType]::ParameterName, 'Reload source code cache (recompile TypeScript)')
            [CompletionResult]::new('--lock', 'lock', [CompletionResultType]::ParameterName, 'Check the specified lock file.

If value is not provided, defaults to "deno.lock" in the current working directory.')
            [CompletionResult]::new('--cert', 'cert', [CompletionResultType]::ParameterName, 'Load certificate authority from PEM encoded file')
            [CompletionResult]::new('--inspect', 'inspect', [CompletionResultType]::ParameterName, 'Activate inspector on host:port (default: 127.0.0.1:9229)')
            [CompletionResult]::new('--inspect-brk', 'inspect-brk', [CompletionResultType]::ParameterName, 'Activate inspector on host:port, wait for debugger to connect and break at the start of user script')
            [CompletionResult]::new('--inspect-wait', 'inspect-wait', [CompletionResultType]::ParameterName, 'Activate inspector on host:port and wait for debugger to connect before running user code')
            [CompletionResult]::new('--location', 'location', [CompletionResultType]::ParameterName, 'Value of ''globalThis.location'' used by some web APIs')
            [CompletionResult]::new('--v8-flags', 'v8-flags', [CompletionResultType]::ParameterName, 'Set V8 command line options')
            [CompletionResult]::new('--seed', 'seed', [CompletionResultType]::ParameterName, 'Set the random number generator seed')
            [CompletionResult]::new('--check', 'check', [CompletionResultType]::ParameterName, 'Type-check modules')
            [CompletionResult]::new('--ext', 'ext', [CompletionResultType]::ParameterName, 'Set content type of the supplied file')
            [CompletionResult]::new('--unstable', 'unstable', [CompletionResultType]::ParameterName, 'Enable unstable features and APIs')
            [CompletionResult]::new('-q', 'q', [CompletionResultType]::ParameterName, 'Suppress diagnostic output')
            [CompletionResult]::new('--quiet', 'quiet', [CompletionResultType]::ParameterName, 'Suppress diagnostic output')
            [CompletionResult]::new('--no-remote', 'no-remote', [CompletionResultType]::ParameterName, 'Do not resolve remote modules')
            [CompletionResult]::new('--no-npm', 'no-npm', [CompletionResultType]::ParameterName, 'Do not resolve npm modules')
            [CompletionResult]::new('--no-config', 'no-config', [CompletionResultType]::ParameterName, 'Disable automatic loading of the configuration file.')
            [CompletionResult]::new('--lock-write', 'lock-write', [CompletionResultType]::ParameterName, 'Force overwriting the lock file.')
            [CompletionResult]::new('--no-lock', 'no-lock', [CompletionResultType]::ParameterName, 'Disable auto discovery of the lock file.')
            [CompletionResult]::new('--cached-only', 'cached-only', [CompletionResultType]::ParameterName, 'Require that remote dependencies are already cached')
            [CompletionResult]::new('--enable-testing-features-do-not-use', 'enable-testing-features-do-not-use', [CompletionResultType]::ParameterName, 'INTERNAL: Enable internal features used during integration testing')
            [CompletionResult]::new('-T', 'T', [CompletionResultType]::ParameterName, 'deprecated: Treat eval input as TypeScript')
            [CompletionResult]::new('--ts', 'ts', [CompletionResultType]::ParameterName, 'deprecated: Treat eval input as TypeScript')
            [CompletionResult]::new('-p', 'p', [CompletionResultType]::ParameterName, 'print result to stdout')
            [CompletionResult]::new('--print', 'print', [CompletionResultType]::ParameterName, 'print result to stdout')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'deno;fmt' {
            [CompletionResult]::new('-L', 'L', [CompletionResultType]::ParameterName, 'Set log level')
            [CompletionResult]::new('--log-level', 'log-level', [CompletionResultType]::ParameterName, 'Set log level')
            [CompletionResult]::new('-c', 'c', [CompletionResultType]::ParameterName, 'Specify the configuration file')
            [CompletionResult]::new('--config', 'config', [CompletionResultType]::ParameterName, 'Specify the configuration file')
            [CompletionResult]::new('--ext', 'ext', [CompletionResultType]::ParameterName, 'Set content type of the supplied file')
            [CompletionResult]::new('--ignore', 'ignore', [CompletionResultType]::ParameterName, 'Ignore formatting particular source files')
            [CompletionResult]::new('--use-tabs', 'use-tabs', [CompletionResultType]::ParameterName, 'Use tabs instead of spaces for indentation. Defaults to false.')
            [CompletionResult]::new('--line-width', 'line-width', [CompletionResultType]::ParameterName, 'Define maximum line width. Defaults to 80.')
            [CompletionResult]::new('--indent-width', 'indent-width', [CompletionResultType]::ParameterName, 'Define indentation width. Defaults to 2.')
            [CompletionResult]::new('--single-quote', 'single-quote', [CompletionResultType]::ParameterName, 'Use single quotes. Defaults to false.')
            [CompletionResult]::new('--prose-wrap', 'prose-wrap', [CompletionResultType]::ParameterName, 'Define how prose should be wrapped. Defaults to always.')
            [CompletionResult]::new('--no-semicolons', 'no-semicolons', [CompletionResultType]::ParameterName, 'Don''t use semicolons except where necessary.')
            [CompletionResult]::new('--unstable', 'unstable', [CompletionResultType]::ParameterName, 'Enable unstable features and APIs')
            [CompletionResult]::new('-q', 'q', [CompletionResultType]::ParameterName, 'Suppress diagnostic output')
            [CompletionResult]::new('--quiet', 'quiet', [CompletionResultType]::ParameterName, 'Suppress diagnostic output')
            [CompletionResult]::new('--no-config', 'no-config', [CompletionResultType]::ParameterName, 'Disable automatic loading of the configuration file.')
            [CompletionResult]::new('--check', 'check', [CompletionResultType]::ParameterName, 'Check if the source files are formatted')
            [CompletionResult]::new('--watch', 'watch', [CompletionResultType]::ParameterName, 'Watch for file changes and restart automatically')
            [CompletionResult]::new('--no-clear-screen', 'no-clear-screen', [CompletionResultType]::ParameterName, 'Do not clear terminal screen when under watch mode')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'deno;init' {
            [CompletionResult]::new('-L', 'L', [CompletionResultType]::ParameterName, 'Set log level')
            [CompletionResult]::new('--log-level', 'log-level', [CompletionResultType]::ParameterName, 'Set log level')
            [CompletionResult]::new('--unstable', 'unstable', [CompletionResultType]::ParameterName, 'Enable unstable features and APIs')
            [CompletionResult]::new('-q', 'q', [CompletionResultType]::ParameterName, 'Suppress diagnostic output')
            [CompletionResult]::new('--quiet', 'quiet', [CompletionResultType]::ParameterName, 'Suppress diagnostic output')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'deno;info' {
            [CompletionResult]::new('-L', 'L', [CompletionResultType]::ParameterName, 'Set log level')
            [CompletionResult]::new('--log-level', 'log-level', [CompletionResultType]::ParameterName, 'Set log level')
            [CompletionResult]::new('-r', 'r', [CompletionResultType]::ParameterName, 'Reload source code cache (recompile TypeScript)')
            [CompletionResult]::new('--reload', 'reload', [CompletionResultType]::ParameterName, 'Reload source code cache (recompile TypeScript)')
            [CompletionResult]::new('--cert', 'cert', [CompletionResultType]::ParameterName, 'Load certificate authority from PEM encoded file')
            [CompletionResult]::new('--location', 'location', [CompletionResultType]::ParameterName, 'Show files used for origin bound APIs like the Web Storage API when running a script with ''--location=<HREF>''')
            [CompletionResult]::new('--no-check', 'no-check', [CompletionResultType]::ParameterName, 'Skip type-checking modules')
            [CompletionResult]::new('--lock', 'lock', [CompletionResultType]::ParameterName, 'Check the specified lock file.

If value is not provided, defaults to "deno.lock" in the current working directory.')
            [CompletionResult]::new('-c', 'c', [CompletionResultType]::ParameterName, 'Specify the configuration file')
            [CompletionResult]::new('--config', 'config', [CompletionResultType]::ParameterName, 'Specify the configuration file')
            [CompletionResult]::new('--import-map', 'import-map', [CompletionResultType]::ParameterName, 'Load import map file')
            [CompletionResult]::new('--node-modules-dir', 'node-modules-dir', [CompletionResultType]::ParameterName, 'Enables or disables the use of a local node_modules folder for npm packages')
            [CompletionResult]::new('--unstable', 'unstable', [CompletionResultType]::ParameterName, 'Enable unstable features and APIs')
            [CompletionResult]::new('-q', 'q', [CompletionResultType]::ParameterName, 'Suppress diagnostic output')
            [CompletionResult]::new('--quiet', 'quiet', [CompletionResultType]::ParameterName, 'Suppress diagnostic output')
            [CompletionResult]::new('--no-config', 'no-config', [CompletionResultType]::ParameterName, 'Disable automatic loading of the configuration file.')
            [CompletionResult]::new('--no-remote', 'no-remote', [CompletionResultType]::ParameterName, 'Do not resolve remote modules')
            [CompletionResult]::new('--no-npm', 'no-npm', [CompletionResultType]::ParameterName, 'Do not resolve npm modules')
            [CompletionResult]::new('--no-lock', 'no-lock', [CompletionResultType]::ParameterName, 'Disable auto discovery of the lock file.')
            [CompletionResult]::new('--json', 'json', [CompletionResultType]::ParameterName, 'UNSTABLE: Outputs the information in JSON format')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'deno;install' {
            [CompletionResult]::new('-L', 'L', [CompletionResultType]::ParameterName, 'Set log level')
            [CompletionResult]::new('--log-level', 'log-level', [CompletionResultType]::ParameterName, 'Set log level')
            [CompletionResult]::new('--no-check', 'no-check', [CompletionResultType]::ParameterName, 'Skip type-checking modules')
            [CompletionResult]::new('--import-map', 'import-map', [CompletionResultType]::ParameterName, 'Load import map file')
            [CompletionResult]::new('--node-modules-dir', 'node-modules-dir', [CompletionResultType]::ParameterName, 'Enables or disables the use of a local node_modules folder for npm packages')
            [CompletionResult]::new('-c', 'c', [CompletionResultType]::ParameterName, 'Specify the configuration file')
            [CompletionResult]::new('--config', 'config', [CompletionResultType]::ParameterName, 'Specify the configuration file')
            [CompletionResult]::new('-r', 'r', [CompletionResultType]::ParameterName, 'Reload source code cache (recompile TypeScript)')
            [CompletionResult]::new('--reload', 'reload', [CompletionResultType]::ParameterName, 'Reload source code cache (recompile TypeScript)')
            [CompletionResult]::new('--lock', 'lock', [CompletionResultType]::ParameterName, 'Check the specified lock file.

If value is not provided, defaults to "deno.lock" in the current working directory.')
            [CompletionResult]::new('--cert', 'cert', [CompletionResultType]::ParameterName, 'Load certificate authority from PEM encoded file')
            [CompletionResult]::new('--allow-read', 'allow-read', [CompletionResultType]::ParameterName, 'Allow file system read access. Optionally specify allowed paths.
Docs: https://deno.land/manual@v1.34.3/basics/permissions
Examples:
  --allow-read
  --allow-read="/etc,/var/log.txt"')
            [CompletionResult]::new('--allow-write', 'allow-write', [CompletionResultType]::ParameterName, 'Allow file system write access. Optionally specify allowed paths.
Docs: https://deno.land/manual@v1.34.3/basics/permissions
Examples:
  --allow-write
  --allow-write="/etc,/var/log.txt"')
            [CompletionResult]::new('--allow-net', 'allow-net', [CompletionResultType]::ParameterName, 'Allow network access. Optionally specify allowed IP addresses and host names, with ports as necessary.
Docs: https://deno.land/manual@v1.34.3/basics/permissions
Examples:
  --allow-net
  --allow-net="localhost:8080,deno.land"')
            [CompletionResult]::new('--unsafely-ignore-certificate-errors', 'unsafely-ignore-certificate-errors', [CompletionResultType]::ParameterName, 'DANGER: Disables verification of TLS certificates')
            [CompletionResult]::new('--allow-env', 'allow-env', [CompletionResultType]::ParameterName, 'Allow access to system environment information. Optionally specify accessible environment variables.
Docs: https://deno.land/manual@v1.34.3/basics/permissions
Examples:
  --allow-env
  --allow-env="PORT,HOME,PATH"')
            [CompletionResult]::new('--allow-sys', 'allow-sys', [CompletionResultType]::ParameterName, 'Allow access to OS information. Optionally allow specific APIs by function name.
Docs: https://deno.land/manual@v1.34.3/basics/permissions
Examples:
  --allow-sys
  --allow-sys="systemMemoryInfo,osRelease"')
            [CompletionResult]::new('--allow-run', 'allow-run', [CompletionResultType]::ParameterName, 'Allow running subprocesses. Optionally specify allowed runnable program names.
Docs: https://deno.land/manual@v1.34.3/basics/permissions
Examples:
  --allow-run
  --allow-run="whoami,ps"')
            [CompletionResult]::new('--allow-ffi', 'allow-ffi', [CompletionResultType]::ParameterName, '(Unstable) Allow loading dynamic libraries. Optionally specify allowed directories or files.
Docs: https://deno.land/manual@v1.34.3/basics/permissions
Examples:
  --allow-ffi
  --allow-ffi="./libfoo.so"')
            [CompletionResult]::new('--inspect', 'inspect', [CompletionResultType]::ParameterName, 'Activate inspector on host:port (default: 127.0.0.1:9229)')
            [CompletionResult]::new('--inspect-brk', 'inspect-brk', [CompletionResultType]::ParameterName, 'Activate inspector on host:port, wait for debugger to connect and break at the start of user script')
            [CompletionResult]::new('--inspect-wait', 'inspect-wait', [CompletionResultType]::ParameterName, 'Activate inspector on host:port and wait for debugger to connect before running user code')
            [CompletionResult]::new('--location', 'location', [CompletionResultType]::ParameterName, 'Value of ''globalThis.location'' used by some web APIs')
            [CompletionResult]::new('--v8-flags', 'v8-flags', [CompletionResultType]::ParameterName, 'Set V8 command line options')
            [CompletionResult]::new('--seed', 'seed', [CompletionResultType]::ParameterName, 'Set the random number generator seed')
            [CompletionResult]::new('--check', 'check', [CompletionResultType]::ParameterName, 'Type-check modules')
            [CompletionResult]::new('-n', 'n', [CompletionResultType]::ParameterName, 'Executable file name')
            [CompletionResult]::new('--name', 'name', [CompletionResultType]::ParameterName, 'Executable file name')
            [CompletionResult]::new('--root', 'root', [CompletionResultType]::ParameterName, 'Installation root')
            [CompletionResult]::new('--unstable', 'unstable', [CompletionResultType]::ParameterName, 'Enable unstable features and APIs')
            [CompletionResult]::new('-q', 'q', [CompletionResultType]::ParameterName, 'Suppress diagnostic output')
            [CompletionResult]::new('--quiet', 'quiet', [CompletionResultType]::ParameterName, 'Suppress diagnostic output')
            [CompletionResult]::new('--no-remote', 'no-remote', [CompletionResultType]::ParameterName, 'Do not resolve remote modules')
            [CompletionResult]::new('--no-npm', 'no-npm', [CompletionResultType]::ParameterName, 'Do not resolve npm modules')
            [CompletionResult]::new('--no-config', 'no-config', [CompletionResultType]::ParameterName, 'Disable automatic loading of the configuration file.')
            [CompletionResult]::new('--lock-write', 'lock-write', [CompletionResultType]::ParameterName, 'Force overwriting the lock file.')
            [CompletionResult]::new('--no-lock', 'no-lock', [CompletionResultType]::ParameterName, 'Disable auto discovery of the lock file.')
            [CompletionResult]::new('--allow-hrtime', 'allow-hrtime', [CompletionResultType]::ParameterName, 'Allow high-resolution time measurement. Note: this can enable timing attacks and fingerprinting.
Docs: https://deno.land/manual@v1.34.3/basics/permissions
')
            [CompletionResult]::new('-A', 'A', [CompletionResultType]::ParameterName, 'Allow all permissions. Learn more about permissions in Deno:
https://deno.land/manual@v1.34.3/basics/permissions
')
            [CompletionResult]::new('--allow-all', 'allow-all', [CompletionResultType]::ParameterName, 'Allow all permissions. Learn more about permissions in Deno:
https://deno.land/manual@v1.34.3/basics/permissions
')
            [CompletionResult]::new('--prompt', 'prompt', [CompletionResultType]::ParameterName, 'deprecated: Fallback to prompt if required permission wasn''t passed')
            [CompletionResult]::new('--no-prompt', 'no-prompt', [CompletionResultType]::ParameterName, 'Always throw if required permission wasn''t passed')
            [CompletionResult]::new('--cached-only', 'cached-only', [CompletionResultType]::ParameterName, 'Require that remote dependencies are already cached')
            [CompletionResult]::new('--enable-testing-features-do-not-use', 'enable-testing-features-do-not-use', [CompletionResultType]::ParameterName, 'INTERNAL: Enable internal features used during integration testing')
            [CompletionResult]::new('-f', 'f', [CompletionResultType]::ParameterName, 'Forcefully overwrite existing installation')
            [CompletionResult]::new('--force', 'force', [CompletionResultType]::ParameterName, 'Forcefully overwrite existing installation')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'deno;uninstall' {
            [CompletionResult]::new('-L', 'L', [CompletionResultType]::ParameterName, 'Set log level')
            [CompletionResult]::new('--log-level', 'log-level', [CompletionResultType]::ParameterName, 'Set log level')
            [CompletionResult]::new('--root', 'root', [CompletionResultType]::ParameterName, 'Installation root')
            [CompletionResult]::new('--unstable', 'unstable', [CompletionResultType]::ParameterName, 'Enable unstable features and APIs')
            [CompletionResult]::new('-q', 'q', [CompletionResultType]::ParameterName, 'Suppress diagnostic output')
            [CompletionResult]::new('--quiet', 'quiet', [CompletionResultType]::ParameterName, 'Suppress diagnostic output')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'deno;lsp' {
            [CompletionResult]::new('-L', 'L', [CompletionResultType]::ParameterName, 'Set log level')
            [CompletionResult]::new('--log-level', 'log-level', [CompletionResultType]::ParameterName, 'Set log level')
            [CompletionResult]::new('--unstable', 'unstable', [CompletionResultType]::ParameterName, 'Enable unstable features and APIs')
            [CompletionResult]::new('-q', 'q', [CompletionResultType]::ParameterName, 'Suppress diagnostic output')
            [CompletionResult]::new('--quiet', 'quiet', [CompletionResultType]::ParameterName, 'Suppress diagnostic output')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'deno;lint' {
            [CompletionResult]::new('-L', 'L', [CompletionResultType]::ParameterName, 'Set log level')
            [CompletionResult]::new('--log-level', 'log-level', [CompletionResultType]::ParameterName, 'Set log level')
            [CompletionResult]::new('--rules-tags', 'rules-tags', [CompletionResultType]::ParameterName, 'Use set of rules with a tag')
            [CompletionResult]::new('--rules-include', 'rules-include', [CompletionResultType]::ParameterName, 'Include lint rules')
            [CompletionResult]::new('--rules-exclude', 'rules-exclude', [CompletionResultType]::ParameterName, 'Exclude lint rules')
            [CompletionResult]::new('-c', 'c', [CompletionResultType]::ParameterName, 'Specify the configuration file')
            [CompletionResult]::new('--config', 'config', [CompletionResultType]::ParameterName, 'Specify the configuration file')
            [CompletionResult]::new('--ignore', 'ignore', [CompletionResultType]::ParameterName, 'Ignore linting particular source files')
            [CompletionResult]::new('--unstable', 'unstable', [CompletionResultType]::ParameterName, 'Enable unstable features and APIs')
            [CompletionResult]::new('-q', 'q', [CompletionResultType]::ParameterName, 'Suppress diagnostic output')
            [CompletionResult]::new('--quiet', 'quiet', [CompletionResultType]::ParameterName, 'Suppress diagnostic output')
            [CompletionResult]::new('--rules', 'rules', [CompletionResultType]::ParameterName, 'List available rules')
            [CompletionResult]::new('--no-config', 'no-config', [CompletionResultType]::ParameterName, 'Disable automatic loading of the configuration file.')
            [CompletionResult]::new('--json', 'json', [CompletionResultType]::ParameterName, 'Output lint result in JSON format')
            [CompletionResult]::new('--compact', 'compact', [CompletionResultType]::ParameterName, 'Output lint result in compact format')
            [CompletionResult]::new('--watch', 'watch', [CompletionResultType]::ParameterName, 'Watch for file changes and restart automatically')
            [CompletionResult]::new('--no-clear-screen', 'no-clear-screen', [CompletionResultType]::ParameterName, 'Do not clear terminal screen when under watch mode')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'deno;repl' {
            [CompletionResult]::new('-L', 'L', [CompletionResultType]::ParameterName, 'Set log level')
            [CompletionResult]::new('--log-level', 'log-level', [CompletionResultType]::ParameterName, 'Set log level')
            [CompletionResult]::new('--no-check', 'no-check', [CompletionResultType]::ParameterName, 'Skip type-checking modules')
            [CompletionResult]::new('--import-map', 'import-map', [CompletionResultType]::ParameterName, 'Load import map file')
            [CompletionResult]::new('--node-modules-dir', 'node-modules-dir', [CompletionResultType]::ParameterName, 'Enables or disables the use of a local node_modules folder for npm packages')
            [CompletionResult]::new('-c', 'c', [CompletionResultType]::ParameterName, 'Specify the configuration file')
            [CompletionResult]::new('--config', 'config', [CompletionResultType]::ParameterName, 'Specify the configuration file')
            [CompletionResult]::new('-r', 'r', [CompletionResultType]::ParameterName, 'Reload source code cache (recompile TypeScript)')
            [CompletionResult]::new('--reload', 'reload', [CompletionResultType]::ParameterName, 'Reload source code cache (recompile TypeScript)')
            [CompletionResult]::new('--lock', 'lock', [CompletionResultType]::ParameterName, 'Check the specified lock file.

If value is not provided, defaults to "deno.lock" in the current working directory.')
            [CompletionResult]::new('--cert', 'cert', [CompletionResultType]::ParameterName, 'Load certificate authority from PEM encoded file')
            [CompletionResult]::new('--allow-read', 'allow-read', [CompletionResultType]::ParameterName, 'Allow file system read access. Optionally specify allowed paths.
Docs: https://deno.land/manual@v1.34.3/basics/permissions
Examples:
  --allow-read
  --allow-read="/etc,/var/log.txt"')
            [CompletionResult]::new('--allow-write', 'allow-write', [CompletionResultType]::ParameterName, 'Allow file system write access. Optionally specify allowed paths.
Docs: https://deno.land/manual@v1.34.3/basics/permissions
Examples:
  --allow-write
  --allow-write="/etc,/var/log.txt"')
            [CompletionResult]::new('--allow-net', 'allow-net', [CompletionResultType]::ParameterName, 'Allow network access. Optionally specify allowed IP addresses and host names, with ports as necessary.
Docs: https://deno.land/manual@v1.34.3/basics/permissions
Examples:
  --allow-net
  --allow-net="localhost:8080,deno.land"')
            [CompletionResult]::new('--unsafely-ignore-certificate-errors', 'unsafely-ignore-certificate-errors', [CompletionResultType]::ParameterName, 'DANGER: Disables verification of TLS certificates')
            [CompletionResult]::new('--allow-env', 'allow-env', [CompletionResultType]::ParameterName, 'Allow access to system environment information. Optionally specify accessible environment variables.
Docs: https://deno.land/manual@v1.34.3/basics/permissions
Examples:
  --allow-env
  --allow-env="PORT,HOME,PATH"')
            [CompletionResult]::new('--allow-sys', 'allow-sys', [CompletionResultType]::ParameterName, 'Allow access to OS information. Optionally allow specific APIs by function name.
Docs: https://deno.land/manual@v1.34.3/basics/permissions
Examples:
  --allow-sys
  --allow-sys="systemMemoryInfo,osRelease"')
            [CompletionResult]::new('--allow-run', 'allow-run', [CompletionResultType]::ParameterName, 'Allow running subprocesses. Optionally specify allowed runnable program names.
Docs: https://deno.land/manual@v1.34.3/basics/permissions
Examples:
  --allow-run
  --allow-run="whoami,ps"')
            [CompletionResult]::new('--allow-ffi', 'allow-ffi', [CompletionResultType]::ParameterName, '(Unstable) Allow loading dynamic libraries. Optionally specify allowed directories or files.
Docs: https://deno.land/manual@v1.34.3/basics/permissions
Examples:
  --allow-ffi
  --allow-ffi="./libfoo.so"')
            [CompletionResult]::new('--inspect', 'inspect', [CompletionResultType]::ParameterName, 'Activate inspector on host:port (default: 127.0.0.1:9229)')
            [CompletionResult]::new('--inspect-brk', 'inspect-brk', [CompletionResultType]::ParameterName, 'Activate inspector on host:port, wait for debugger to connect and break at the start of user script')
            [CompletionResult]::new('--inspect-wait', 'inspect-wait', [CompletionResultType]::ParameterName, 'Activate inspector on host:port and wait for debugger to connect before running user code')
            [CompletionResult]::new('--location', 'location', [CompletionResultType]::ParameterName, 'Value of ''globalThis.location'' used by some web APIs')
            [CompletionResult]::new('--v8-flags', 'v8-flags', [CompletionResultType]::ParameterName, 'Set V8 command line options')
            [CompletionResult]::new('--seed', 'seed', [CompletionResultType]::ParameterName, 'Set the random number generator seed')
            [CompletionResult]::new('--check', 'check', [CompletionResultType]::ParameterName, 'Type-check modules')
            [CompletionResult]::new('--eval-file', 'eval-file', [CompletionResultType]::ParameterName, 'Evaluates the provided file(s) as scripts when the REPL starts. Accepts file paths and URLs.')
            [CompletionResult]::new('--eval', 'eval', [CompletionResultType]::ParameterName, 'Evaluates the provided code when the REPL starts.')
            [CompletionResult]::new('--unstable', 'unstable', [CompletionResultType]::ParameterName, 'Enable unstable features and APIs')
            [CompletionResult]::new('-q', 'q', [CompletionResultType]::ParameterName, 'Suppress diagnostic output')
            [CompletionResult]::new('--quiet', 'quiet', [CompletionResultType]::ParameterName, 'Suppress diagnostic output')
            [CompletionResult]::new('--no-remote', 'no-remote', [CompletionResultType]::ParameterName, 'Do not resolve remote modules')
            [CompletionResult]::new('--no-npm', 'no-npm', [CompletionResultType]::ParameterName, 'Do not resolve npm modules')
            [CompletionResult]::new('--no-config', 'no-config', [CompletionResultType]::ParameterName, 'Disable automatic loading of the configuration file.')
            [CompletionResult]::new('--lock-write', 'lock-write', [CompletionResultType]::ParameterName, 'Force overwriting the lock file.')
            [CompletionResult]::new('--no-lock', 'no-lock', [CompletionResultType]::ParameterName, 'Disable auto discovery of the lock file.')
            [CompletionResult]::new('--allow-hrtime', 'allow-hrtime', [CompletionResultType]::ParameterName, 'Allow high-resolution time measurement. Note: this can enable timing attacks and fingerprinting.
Docs: https://deno.land/manual@v1.34.3/basics/permissions
')
            [CompletionResult]::new('-A', 'A', [CompletionResultType]::ParameterName, 'Allow all permissions. Learn more about permissions in Deno:
https://deno.land/manual@v1.34.3/basics/permissions
')
            [CompletionResult]::new('--allow-all', 'allow-all', [CompletionResultType]::ParameterName, 'Allow all permissions. Learn more about permissions in Deno:
https://deno.land/manual@v1.34.3/basics/permissions
')
            [CompletionResult]::new('--prompt', 'prompt', [CompletionResultType]::ParameterName, 'deprecated: Fallback to prompt if required permission wasn''t passed')
            [CompletionResult]::new('--no-prompt', 'no-prompt', [CompletionResultType]::ParameterName, 'Always throw if required permission wasn''t passed')
            [CompletionResult]::new('--cached-only', 'cached-only', [CompletionResultType]::ParameterName, 'Require that remote dependencies are already cached')
            [CompletionResult]::new('--enable-testing-features-do-not-use', 'enable-testing-features-do-not-use', [CompletionResultType]::ParameterName, 'INTERNAL: Enable internal features used during integration testing')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'deno;task' {
            [CompletionResult]::new('-L', 'L', [CompletionResultType]::ParameterName, 'Set log level')
            [CompletionResult]::new('--log-level', 'log-level', [CompletionResultType]::ParameterName, 'Set log level')
            [CompletionResult]::new('-c', 'c', [CompletionResultType]::ParameterName, 'Specify the configuration file')
            [CompletionResult]::new('--config', 'config', [CompletionResultType]::ParameterName, 'Specify the configuration file')
            [CompletionResult]::new('--cwd', 'cwd', [CompletionResultType]::ParameterName, 'Specify the directory to run the task in')
            [CompletionResult]::new('--unstable', 'unstable', [CompletionResultType]::ParameterName, 'Enable unstable features and APIs')
            [CompletionResult]::new('-q', 'q', [CompletionResultType]::ParameterName, 'Suppress diagnostic output')
            [CompletionResult]::new('--quiet', 'quiet', [CompletionResultType]::ParameterName, 'Suppress diagnostic output')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'deno;test' {
            [CompletionResult]::new('-L', 'L', [CompletionResultType]::ParameterName, 'Set log level')
            [CompletionResult]::new('--log-level', 'log-level', [CompletionResultType]::ParameterName, 'Set log level')
            [CompletionResult]::new('--no-check', 'no-check', [CompletionResultType]::ParameterName, 'Skip type-checking modules')
            [CompletionResult]::new('--import-map', 'import-map', [CompletionResultType]::ParameterName, 'Load import map file')
            [CompletionResult]::new('--node-modules-dir', 'node-modules-dir', [CompletionResultType]::ParameterName, 'Enables or disables the use of a local node_modules folder for npm packages')
            [CompletionResult]::new('-c', 'c', [CompletionResultType]::ParameterName, 'Specify the configuration file')
            [CompletionResult]::new('--config', 'config', [CompletionResultType]::ParameterName, 'Specify the configuration file')
            [CompletionResult]::new('-r', 'r', [CompletionResultType]::ParameterName, 'Reload source code cache (recompile TypeScript)')
            [CompletionResult]::new('--reload', 'reload', [CompletionResultType]::ParameterName, 'Reload source code cache (recompile TypeScript)')
            [CompletionResult]::new('--lock', 'lock', [CompletionResultType]::ParameterName, 'Check the specified lock file.

If value is not provided, defaults to "deno.lock" in the current working directory.')
            [CompletionResult]::new('--cert', 'cert', [CompletionResultType]::ParameterName, 'Load certificate authority from PEM encoded file')
            [CompletionResult]::new('--allow-read', 'allow-read', [CompletionResultType]::ParameterName, 'Allow file system read access. Optionally specify allowed paths.
Docs: https://deno.land/manual@v1.34.3/basics/permissions
Examples:
  --allow-read
  --allow-read="/etc,/var/log.txt"')
            [CompletionResult]::new('--allow-write', 'allow-write', [CompletionResultType]::ParameterName, 'Allow file system write access. Optionally specify allowed paths.
Docs: https://deno.land/manual@v1.34.3/basics/permissions
Examples:
  --allow-write
  --allow-write="/etc,/var/log.txt"')
            [CompletionResult]::new('--allow-net', 'allow-net', [CompletionResultType]::ParameterName, 'Allow network access. Optionally specify allowed IP addresses and host names, with ports as necessary.
Docs: https://deno.land/manual@v1.34.3/basics/permissions
Examples:
  --allow-net
  --allow-net="localhost:8080,deno.land"')
            [CompletionResult]::new('--unsafely-ignore-certificate-errors', 'unsafely-ignore-certificate-errors', [CompletionResultType]::ParameterName, 'DANGER: Disables verification of TLS certificates')
            [CompletionResult]::new('--allow-env', 'allow-env', [CompletionResultType]::ParameterName, 'Allow access to system environment information. Optionally specify accessible environment variables.
Docs: https://deno.land/manual@v1.34.3/basics/permissions
Examples:
  --allow-env
  --allow-env="PORT,HOME,PATH"')
            [CompletionResult]::new('--allow-sys', 'allow-sys', [CompletionResultType]::ParameterName, 'Allow access to OS information. Optionally allow specific APIs by function name.
Docs: https://deno.land/manual@v1.34.3/basics/permissions
Examples:
  --allow-sys
  --allow-sys="systemMemoryInfo,osRelease"')
            [CompletionResult]::new('--allow-run', 'allow-run', [CompletionResultType]::ParameterName, 'Allow running subprocesses. Optionally specify allowed runnable program names.
Docs: https://deno.land/manual@v1.34.3/basics/permissions
Examples:
  --allow-run
  --allow-run="whoami,ps"')
            [CompletionResult]::new('--allow-ffi', 'allow-ffi', [CompletionResultType]::ParameterName, '(Unstable) Allow loading dynamic libraries. Optionally specify allowed directories or files.
Docs: https://deno.land/manual@v1.34.3/basics/permissions
Examples:
  --allow-ffi
  --allow-ffi="./libfoo.so"')
            [CompletionResult]::new('--inspect', 'inspect', [CompletionResultType]::ParameterName, 'Activate inspector on host:port (default: 127.0.0.1:9229)')
            [CompletionResult]::new('--inspect-brk', 'inspect-brk', [CompletionResultType]::ParameterName, 'Activate inspector on host:port, wait for debugger to connect and break at the start of user script')
            [CompletionResult]::new('--inspect-wait', 'inspect-wait', [CompletionResultType]::ParameterName, 'Activate inspector on host:port and wait for debugger to connect before running user code')
            [CompletionResult]::new('--location', 'location', [CompletionResultType]::ParameterName, 'Value of ''globalThis.location'' used by some web APIs')
            [CompletionResult]::new('--v8-flags', 'v8-flags', [CompletionResultType]::ParameterName, 'Set V8 command line options')
            [CompletionResult]::new('--seed', 'seed', [CompletionResultType]::ParameterName, 'Set the random number generator seed')
            [CompletionResult]::new('--check', 'check', [CompletionResultType]::ParameterName, 'Type-check modules')
            [CompletionResult]::new('--ignore', 'ignore', [CompletionResultType]::ParameterName, 'Ignore files')
            [CompletionResult]::new('--fail-fast', 'fail-fast', [CompletionResultType]::ParameterName, 'Stop after N errors. Defaults to stopping after first failure.')
            [CompletionResult]::new('--filter', 'filter', [CompletionResultType]::ParameterName, 'Run tests with this string or pattern in the test name')
            [CompletionResult]::new('--shuffle', 'shuffle', [CompletionResultType]::ParameterName, 'Shuffle the order in which the tests are run')
            [CompletionResult]::new('--coverage', 'coverage', [CompletionResultType]::ParameterName, 'Collect coverage profile data into DIR')
            [CompletionResult]::new('-j', 'j', [CompletionResultType]::ParameterName, 'deprecated: Number of parallel workers, defaults to number of available CPUs when no value is provided. Defaults to 1 when the option is not present.')
            [CompletionResult]::new('--jobs', 'jobs', [CompletionResultType]::ParameterName, 'deprecated: Number of parallel workers, defaults to number of available CPUs when no value is provided. Defaults to 1 when the option is not present.')
            [CompletionResult]::new('--unstable', 'unstable', [CompletionResultType]::ParameterName, 'Enable unstable features and APIs')
            [CompletionResult]::new('-q', 'q', [CompletionResultType]::ParameterName, 'Suppress diagnostic output')
            [CompletionResult]::new('--quiet', 'quiet', [CompletionResultType]::ParameterName, 'Suppress diagnostic output')
            [CompletionResult]::new('--no-remote', 'no-remote', [CompletionResultType]::ParameterName, 'Do not resolve remote modules')
            [CompletionResult]::new('--no-npm', 'no-npm', [CompletionResultType]::ParameterName, 'Do not resolve npm modules')
            [CompletionResult]::new('--no-config', 'no-config', [CompletionResultType]::ParameterName, 'Disable automatic loading of the configuration file.')
            [CompletionResult]::new('--lock-write', 'lock-write', [CompletionResultType]::ParameterName, 'Force overwriting the lock file.')
            [CompletionResult]::new('--no-lock', 'no-lock', [CompletionResultType]::ParameterName, 'Disable auto discovery of the lock file.')
            [CompletionResult]::new('--allow-hrtime', 'allow-hrtime', [CompletionResultType]::ParameterName, 'Allow high-resolution time measurement. Note: this can enable timing attacks and fingerprinting.
Docs: https://deno.land/manual@v1.34.3/basics/permissions
')
            [CompletionResult]::new('-A', 'A', [CompletionResultType]::ParameterName, 'Allow all permissions. Learn more about permissions in Deno:
https://deno.land/manual@v1.34.3/basics/permissions
')
            [CompletionResult]::new('--allow-all', 'allow-all', [CompletionResultType]::ParameterName, 'Allow all permissions. Learn more about permissions in Deno:
https://deno.land/manual@v1.34.3/basics/permissions
')
            [CompletionResult]::new('--prompt', 'prompt', [CompletionResultType]::ParameterName, 'deprecated: Fallback to prompt if required permission wasn''t passed')
            [CompletionResult]::new('--no-prompt', 'no-prompt', [CompletionResultType]::ParameterName, 'Always throw if required permission wasn''t passed')
            [CompletionResult]::new('--cached-only', 'cached-only', [CompletionResultType]::ParameterName, 'Require that remote dependencies are already cached')
            [CompletionResult]::new('--enable-testing-features-do-not-use', 'enable-testing-features-do-not-use', [CompletionResultType]::ParameterName, 'INTERNAL: Enable internal features used during integration testing')
            [CompletionResult]::new('--no-run', 'no-run', [CompletionResultType]::ParameterName, 'Cache test modules, but don''t run tests')
            [CompletionResult]::new('--trace-ops', 'trace-ops', [CompletionResultType]::ParameterName, 'Enable tracing of async ops. Useful when debugging leaking ops in test, but impacts test execution time.')
            [CompletionResult]::new('--doc', 'doc', [CompletionResultType]::ParameterName, 'Type-check code blocks in JSDoc and Markdown')
            [CompletionResult]::new('--allow-none', 'allow-none', [CompletionResultType]::ParameterName, 'Don''t return error code if no test files are found')
            [CompletionResult]::new('--parallel', 'parallel', [CompletionResultType]::ParameterName, 'Run test modules in parallel. Parallelism defaults to the number of available CPUs or the value in the DENO_JOBS environment variable.')
            [CompletionResult]::new('--watch', 'watch', [CompletionResultType]::ParameterName, 'Watch for file changes and restart automatically')
            [CompletionResult]::new('--no-clear-screen', 'no-clear-screen', [CompletionResultType]::ParameterName, 'Do not clear terminal screen when under watch mode')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'deno;types' {
            [CompletionResult]::new('-L', 'L', [CompletionResultType]::ParameterName, 'Set log level')
            [CompletionResult]::new('--log-level', 'log-level', [CompletionResultType]::ParameterName, 'Set log level')
            [CompletionResult]::new('--unstable', 'unstable', [CompletionResultType]::ParameterName, 'Enable unstable features and APIs')
            [CompletionResult]::new('-q', 'q', [CompletionResultType]::ParameterName, 'Suppress diagnostic output')
            [CompletionResult]::new('--quiet', 'quiet', [CompletionResultType]::ParameterName, 'Suppress diagnostic output')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'deno;upgrade' {
            [CompletionResult]::new('-L', 'L', [CompletionResultType]::ParameterName, 'Set log level')
            [CompletionResult]::new('--log-level', 'log-level', [CompletionResultType]::ParameterName, 'Set log level')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'The version to upgrade to')
            [CompletionResult]::new('--output', 'output', [CompletionResultType]::ParameterName, 'The path to output the updated version to')
            [CompletionResult]::new('--cert', 'cert', [CompletionResultType]::ParameterName, 'Load certificate authority from PEM encoded file')
            [CompletionResult]::new('--unstable', 'unstable', [CompletionResultType]::ParameterName, 'Enable unstable features and APIs')
            [CompletionResult]::new('-q', 'q', [CompletionResultType]::ParameterName, 'Suppress diagnostic output')
            [CompletionResult]::new('--quiet', 'quiet', [CompletionResultType]::ParameterName, 'Suppress diagnostic output')
            [CompletionResult]::new('--dry-run', 'dry-run', [CompletionResultType]::ParameterName, 'Perform all checks without replacing old exe')
            [CompletionResult]::new('-f', 'f', [CompletionResultType]::ParameterName, 'Replace current exe even if not out-of-date')
            [CompletionResult]::new('--force', 'force', [CompletionResultType]::ParameterName, 'Replace current exe even if not out-of-date')
            [CompletionResult]::new('--canary', 'canary', [CompletionResultType]::ParameterName, 'Upgrade to canary builds')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'deno;vendor' {
            [CompletionResult]::new('-L', 'L', [CompletionResultType]::ParameterName, 'Set log level')
            [CompletionResult]::new('--log-level', 'log-level', [CompletionResultType]::ParameterName, 'Set log level')
            [CompletionResult]::new('--output', 'output', [CompletionResultType]::ParameterName, 'The directory to output the vendored modules to')
            [CompletionResult]::new('-c', 'c', [CompletionResultType]::ParameterName, 'Specify the configuration file')
            [CompletionResult]::new('--config', 'config', [CompletionResultType]::ParameterName, 'Specify the configuration file')
            [CompletionResult]::new('--import-map', 'import-map', [CompletionResultType]::ParameterName, 'Load import map file')
            [CompletionResult]::new('--lock', 'lock', [CompletionResultType]::ParameterName, 'Check the specified lock file.

If value is not provided, defaults to "deno.lock" in the current working directory.')
            [CompletionResult]::new('--node-modules-dir', 'node-modules-dir', [CompletionResultType]::ParameterName, 'Enables or disables the use of a local node_modules folder for npm packages')
            [CompletionResult]::new('-r', 'r', [CompletionResultType]::ParameterName, 'Reload source code cache (recompile TypeScript)')
            [CompletionResult]::new('--reload', 'reload', [CompletionResultType]::ParameterName, 'Reload source code cache (recompile TypeScript)')
            [CompletionResult]::new('--cert', 'cert', [CompletionResultType]::ParameterName, 'Load certificate authority from PEM encoded file')
            [CompletionResult]::new('--unstable', 'unstable', [CompletionResultType]::ParameterName, 'Enable unstable features and APIs')
            [CompletionResult]::new('-q', 'q', [CompletionResultType]::ParameterName, 'Suppress diagnostic output')
            [CompletionResult]::new('--quiet', 'quiet', [CompletionResultType]::ParameterName, 'Suppress diagnostic output')
            [CompletionResult]::new('-f', 'f', [CompletionResultType]::ParameterName, 'Forcefully overwrite conflicting files in existing output directory')
            [CompletionResult]::new('--force', 'force', [CompletionResultType]::ParameterName, 'Forcefully overwrite conflicting files in existing output directory')
            [CompletionResult]::new('--no-config', 'no-config', [CompletionResultType]::ParameterName, 'Disable automatic loading of the configuration file.')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'deno;help' {
            break
        }
    })

    $completions.Where{ $_.CompletionText -like "$wordToComplete*" } |
        Sort-Object -Property ListItemText
}
