// Cli utility for the Chalk Development Suite.

import { Program, Language: Lang } from "chalk-compiler";

Error unexpectedArgs(
  ?String unexpected, // `null` means end of input.
  String expected,
  ?String after = unexpected ?? undefined : null
) =>
  Error("Unexpected ${ unexpected ? "argument: $unexpected" : 'end of input' }.\n
    Expected $expected${ after ?: " after $after" : '' }."
  );

Error languageUnspecified =
  Error("Language of the module must be specified,
    eg. `--module=${Lang.chalkScript.abbr}` for ChalkScript."
  );

Error unknownLanguage(String lang) =>
  Error("Unknown language: $lang.\nLanguage must be one of: ${Lang.values.join(', ')}.");

let ProgramSource = (( String folder, ?(( String pathOrModule, ?Lang langIfModule )) ));
let CliArg = {{ name: String, value: ?String }};

?CliArg parseArg(String arg) {
  arg.startsWith("--") || return null;
  
  int i = arg.findIndex("="); // TODO this must return arg.length if `=` is not in arg.
  
  return { name: arg.slice(2, i), value: arg.slice(i + 1) }; // TODO `arg.slice(i + 1)` must return null of out of range.
}

ProgramSource|Error parseProgramSource([]String args, Int i) { // TODO check arg length
  i == args.length && return unexpectedArgs(null, 'the root folder');
  
  String folder = arg[i];
  
  mut ?CliArg arg = parseArg(folder);
  
  arg ||? return unexpectedArgs(arg.name, "the root folder", args[i - 1]);
  
  i += 1;
  
  i == args.length && return ( folder, null );
  
  arg = parseArg(arg[i]);
  
  arg && {
    arg.name != "module" && return unexpectedArgs(arg.name, "the 'module' argument or the main file.", args[i - 1]);
    arg.value || return languageUnspecified;
    
    Lang lang = Lang.byExtension(arg.value);
    
    lang || return unknownLanguage(arg.value);
    
    i += 1;
    
    i == args.length && return unexpectedArgs(null, "the last argument to be the main module");
    
    arg = parseArg(args[i]);
    
    arg &&? return unexpectedArgs(arg.name, "the last argument to be the main module", args[i - 1])
    
    i += 1;
    
    return ( folder, ( args[i - 1], lang ) );
  }
  
  i += 1;
  
  return ( folder, ( args[i - 1], null ) );
}

Null repl(Folder cd, IOStream console) {
  
}

let ModuleLoader = Promise<?String|Error>(String path);

///
  Two special rules:
  
  0. `-asdf` will be treated as `--flags=asdf`
  1. `fdsa` (without hyphen) will be treated as --[defaultParam]=fdsa
///
let Command = {{
  help: String,
  default: String,
  args: Record[String],
  
  where {
    All Command c: c.args.fields.has(c.default);
  }
}};

let commands = {
  run: {
    help: TODO,
    default: 'folder'
    args: { folder: String },
  },
};

pub class Main {
  new({ []String args, ?Folder cd, IOStream console }) {
    args.length == 1 && return repl(cd, console);
    
    switch args[0] {
      "run" =>
      "repl" =>
      "debug" =>
      "translate" =>
      "fix" =>
      "pkg" =>
      "init" =>
      "help" =>
    }
    
    i == args.length || return unexpectedArgs(args[i], 'end of input', args[i - 1]);
    
    Program loadString(String str) =>
      Program(path => path == "./main.chs" ? str : null);
    
    Program loadFsEntry(Folder root, Path path) {
      root = root.open(path.isFile ? path.parent : path);
      
      return path.isFile ? Program(path => root.read())
    }
  }
}
