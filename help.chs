// Help messages.

import Main from 'main.chs';

pub String help = 
  """
    Chalk version TODO.\n
    \n
    Website: TODO.\n
    Repo: github.com/chalk-lang/cli\n
    \n
    The avaiable subcommands are:\n
    ${ [ ...Main.commands.map((String cmd, _) => cmd) ].join(', ') }.\n
    \n
    Use `chalk help *command*` for more info.\n
    Use `chalk *command* ...args` to execute a command.\n
  """;

pub String repl =
  """
  """;

pub String debug = ;

pub String translate = ;

pub String fix = 'TODO';

pub String pkg = 
  '''
    TODO;\n
    \n
    `chalk pkg install [ *dependency@version-mask* ... ]`\n
    \n
    Installs new dependencies at the highest possible version compatible with the
    specified mask.\n
    \n
    Makes sure all installed dependencies are of the correct version, uncorrupted,
    reinstalls them if not, removes unused dependencies.\n
    \n
    Version syntax:\n
    Version = Interval | Interval "|" Version\n
    Interval = \n
    \n
    Some examples:\n
    `3.0.0` exact version\n
    `<4.=0.0` major less than two\n TODO support `=`?
    `^2.0.0` major more or equal to two\n
    `2-4.0.0` major between 2 (inclusive) and 4 (exclusive)\n
    `2-4.0-3.<5` can be combined for all of major, minor, patch\n
    `version|version` at least one
    \n
    TODO \n
  ''';

pub String update = 
  '''
    `chalk update`\n
    `chalk update [ dependency@version|major|minor|patch ]`\n
    \n
    Updates dependencies to the highest version that is compatible with the
    version mask.\n
    \n
    TODO is this accurate?\n
  ''';

pub String publish =
  '''
    `chalk publish *new-version*`\n
    `chalk publish patch|minor|major`\n
    \n
    TODO finish this message.\n
    Publishes a new version. The `package` field/property/? in ?package.json?.
    must be set.\n
  ''';

pub String init =
  '''
    ```
      chalk init *folder-name*
        [--name="project-name"]\n
        [--repo="https url, default null"]\n
        [--issues="https url, default null"]\n
        [--packages="https url, default null"]\n
        [--use-git="true|false, default true"]\n
    ```
    \n
    Initializes a repository in a new folder *folder-name*.\n
  ''';
