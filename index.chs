// Index file of chalk command-line utility.

import { Command, Flags } from stlib;

import { version } from ./pkg.json;

let Flags langFlags = {
  s: { value: 'ChalkScript', help: 'ChalkScript' },
  f: { value: 'FunctionalChalk', help: 'FunctionalChalk' },
  p: { value: 'Chalk++', help: 'Chalk++' },
};

let commonArgs = {
  root: {
    help: 'root folder relative to which imports are resolved',
    type: Folder,
    required: false,
  },
  main: {
    help: 'path to file relative to root that is the entry point of the application, alternatively use `--code`',
    type: String,
    required: false,
  },
  code: {
    help: 'string of code that is the entry point of the application. Language has to be specified',
    type: String,
    required: false,
    requires: { 'lang' },
  },
  lang: {
    help: 'specifies the language of the value of the `--code` parameter.',
    type: String
    required: false,
    requires: { 'expr' },
    flags: langFlags,
  },
};

let CommonArgsType = { Folder root, ?String main, ?String code, ?String lang };

let commonDefaults = {
  [ 'root' ],
  [ 'root', 'main' ],
};

let Command cmd = {
  version,
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
    init: {
      help: 'Initializes a project in a new folder. TODO',
      defaultParams: {
        [ 'directory' ],
        [ 'directory', 'license' ],
        [ 'directory', 'license', 'author' ],
      },
      args: {
        directory: {
          help: 'directory to create and initialize the repo in',
          type: String,
          required: true,
        },
        license: {
          type: String,
          oneOf: { 'GPL3', 'MIT', 'Unlicense', 'No license' },
          required: true,
        },
        author: {
          help: 'author of the repo, recommended format is "name <email> (website)", with each part optional',
          type: String,
          required: true,
        },
        name: {
          help: 'name of the repository, by default equals to `directory`',
          type: String,
          required: false,
        }
        url: {
          help: 'website of the repo'
          type: String,
          required: false,
        },
        description: {
          help: 'description of the repo',
        }.
        ///
          private: {
            help: 'cannot be published if true';
            type: Bool,
            default: true,
          },
          
          ???
          
          registerRepo: { ... },
          repoServer: { ... },
          
          registerPackage: {
            help: 'registers package at a package manager server'
            type: Bool,
            default: false,
            flags:
          },
          pkgServer: {
            help: 'url of package management server where package will be registered',
            type: string,
            default: 'TODO create a central registry',
          },
        ///
      },
      handler({
        String directory,
        String license,
        String author,
        String name = directory,
        ?String url,
        ?String description
      }, Console console) {
        // TODO init.
      },
    },
    run: {
      help: 'Execute a program.'
      defaultParams: commonDefaults,
      args: commonArgs,
      requires: { { 'main' }, { 'expr' } },
      handler(CommonArgsType args, Console console) {
        // TODO
        
        console.log("Does not work yet.");
      },
    },
    repl: {
      help: 'Open repl and optionally import a program, but don\'t execute anything.',
      defaultParams: commonDefaults,
      args: commonArgs,
      handler(CommonArgsType args, Console console) {
        // TODO
        
        console.log("Does not work yet.");
      },
    },
    debug: {
      help: 'Debug a program.',
      defaultParams: commonDefaults,
      args: commonArgs,
      requires: { { 'main' }, { 'expr' } },
      handler(CommonArgsType args, Console console) {
        // TODO
        
        console.log("Does not work yet.");
      },
    },
    translate: {
      help: 'Translate a program from one language to another.',
      defaultParams: commonDefaults,
      args: {
        ...commonArgs,
        outDir: {
          help: 'output directory',
          type: Folder
          required: false,
        },
        outFile: {
          help: 'output file',
          type: File,
          required: false
        },
        outStdOut: {
          help: 'output translated program to standard output',
          type: Bool,
          required: false,
        }
      },
      requires: { { 'outDir' }, { 'outFile' }, { 'outStdOut' } },
      handler(CommonArgsType args, Console console) {
        // TODO
        
        console.log("Does not work yet.");
      },
    },
    fix: {
      help: 'Fix automatically fixable errors and format source code.',
      defaultParams: commonDefaults,
      args: commonArgs,
      handler(CommonArgsType args, Console console) {
        // TODO
        
        console.log("Does not work yet.");
      },
    },
    pkg: {
      help: 'Commands related to package management.',
      subcommands: {
        install: {
          help: 'TODO',
          args: {},
          handler(args, Console console) {
            // TODO
            
            console.log("Does not work yet.");
          },
        },
        remove: {
          help: 'TODO',
          args: {},
          handler(args, Console console) {
            // TODO
            
            console.log("Does not work yet.");
          },
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
          handler(args, Console console) {
            // TODO
            
            console.log("Does not work yet.");
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
          handler(args, Console console) {
            // TODO
            
            console.log("Does not work yet.");
          },
        },
      },
    },
  },
};

export class Main {
  new({ []String args, ?Folder cd, IOStream console }) {
    cmd.execute(cd, args, console);
  }
}