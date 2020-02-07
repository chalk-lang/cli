// Parameters for the cli.

import { Command, Flags } from stlib;

import { version } from ./packages.json;

let Flags langFlags = {
  s: { shortFor: 's', help: 'ChalkScript' },
  f: { shortFor: 'f', help: 'FunctionalChalk' },
  p: { shortFor: 'p', help: 'Chalk++' },
};

let commonArgs = {
  root: {
    help: 'root folder relative to which imports are resolved',
    type: Folder,
    required: true,
  },
  main: {
    help: 'file that is the entry point of the application, alternatively use `--module`',
    type: File,
    required: false,
  },
  expr: {
    help: 'string of code that is the entry point of the application. Language has to be specified',
    type: String,
    required: false,
    requires: 'lang',
  },
  lang: {
    help: 'specifies the language of the value of the `--expr` parameter.',
    required: false,
    requires: 'expr',
    flags: langFlags,
  },
};

let commonDefaults = {
  [ 'root' ],
  [ 'root', 'main' ],
};

let Command cmd = {
  help:
    '''
      Website: [](TODO).
      
      Use one of the flags to open repl in the specified language. Use the `repl`
      subcommand for more options, like allowing imports.
    ''',
  args: {
    lang: {
      flags: langFlags,
    },
  },
  subcommands: {
    run: {
      help: 'TODO'
      defaultParams: commonDefaults,
      args: commonArgs,
      requires: { { 'main' }, { 'expr' } },
    },
    repl: {
      help: 'TODO',
      defaultParams: commonDefaults,
      args: commonArgs,
      requires: { {} },
    },
    debug: {
      help: 'TODO',
      defaultParams: commonDefaults,
      args: commonArgs,
      requires: { { 'main' }, { 'expr' } },
    },
    translate: {
      help: 'TODO',
      defaultParams: commonDefaults,
      args: {
        ...commonArgs,
        outDir: {
          help: 'TODO',
          type: Folder
          required: false,
        },
        outFile: {
          help: 'TODO',
          type: File,
          required: false
        },
      },
    },
    fix: {
      help: 'TODO',
      defaultParams: commonDefaults
      args: commonArgs,
    },
    pkg: {
      help: 'TODO',
      subcommands: {
        install: {
          help: 'TODO',
          args: {},
        },
        remove: {
          help: 'TODO',
          args: {},
        },
        publish: {
          help: 'TODO',
          args: {
            version: {
              type: String,
              required: true,
              oneOf: { 'major', 'minor', 'patch' },
            }
          },
        },
        update: {
          help: 'TODO',
          defaultParams: { [ 'packages' ] },
          args: {
            packages: {
              help: 'chalk update package@newVersion package@major|minor|patch',
              type: []String,
              validate() {
                // TODO
              },
            },
            all: {
              help: 'version to update all other packages to',
              type: String,
              default: 'none',
              oneOf: { 'major', 'minor', 'patch', 'none' },
            },
          },
        },
      },
    },
    init: {
      help: 'create a new folder and set up a new package',
    },
  },
};

export cli = {
  version,
  command: cmd,
};
