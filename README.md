# puppet_cli_environment

This module provides a custom fact which returns the command-line-interface
specified environment setting. The fact will only return a value if the user
passes the `--environment=` flag to `puppet` on invocation. Otherwise the fact
will be nil.

Having this fact available can be useful in Node Classifiers which are
authoritative for an environment. The fact allows the classifier to distinguish
between when an agent run is requesting an environment different (potentially)
from the default, or from the agent's puppet.conf file, and so make informed
environment assignment decisions.

For a user-invoked Puppet agent run, if the following command is given:

    puppet agent --test --environment=feature42

This fact will return:

    puppet_cli_environment=feature42

For a user-invoked Puppet agent run, if the following command is given:

    puppet agent --test

This fact will return nothing.
