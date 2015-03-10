# puppet_environment_facts

This module provides custom facts which return the agent-specified environment
for a Puppet run, and whether or not the environment was specified with the
command-line interface.

Having these facts available can be useful in Node Classifiers which are
authoritative for an environment. The facts allow the classifier to distinguish
between when an agent run is requesting an environment different (potentially)
from the default, or from the agent's puppet.conf file, what environment it is
requesting, and so make informed environment assignment decisions.

For a user-invoked Puppet agent run, if the following command is given:

    puppet agent --test --environment=feature42

These facts will return:

    agent_specified_environment=feature42
    puppet_environment_setbycli=True

For a user-invoked Puppet agent run, if the following command is given and the
puppet.conf file does not specify an environment:

    puppet agent --test

These facts will return:

    agent_specified_environment=production
    puppet_environment_setbycli=False

For a user-invoked Puppet agent run, if the following command is given and the
puppet.conf file contains `environment=dev`:

    puppet agent --test

These facts will return:

    agent_specified_environment=dev
    puppet_environment_setbycli=False

