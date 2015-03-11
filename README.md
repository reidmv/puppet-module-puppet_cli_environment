# puppet_environment_facts

This module provides custom facts which return the agent-side settings for
environment and noop for the puppet run. Besides the value of the setting for
the run, a fact is provided that returns whether or not the setting was
specified on the command-line

Having these facts available can be useful in Node Classifiers which are
authoritative for an environment. The facts allow the classifier to distinguish
between when an agent run is requesting an environment different (potentially)
from the default, or from the agent's puppet.conf file, what environment it is
requesting, and so make informed environment assignment decisions. Similarly,
knowning when the agent run is no-op or not may be impactful to assigning its
environment.

## Facts

### agent_specified_environment

String. The agent-side value of the environment setting.

### agent_specified_environment_setbycli

Boolean. Whether or not the environment setting was specified on the CLI (e.g.
`--environment=dev`).

### agent_specified_noop

Boolean. The agent-side value of the noop setting.

### agent_specified_noop_setbycli

Boolean. Whether or not the environment setting was specified on the CLI (e.g.
`--noop, or --no-noop`).

## Example Values

For a user-invoked Puppet agent run, if the following command is given:

    puppet agent --test --environment=feature42

These facts will return:

    agent_specified_environment=feature42
    agent_specified_environment_setbycli=True
    agent_specified_noop=False
    agent_specified_noop_setbycli=False

For a user-invoked Puppet agent run, if the following command is given and the
puppet.conf file does not specify an environment:

    puppet agent --test

These facts will return:

    agent_specified_environment=production
    agent_specified_environment_setbycli=False
    agent_specified_noop=False
    agent_specified_noop_setbycli=False

For a user-invoked Puppet agent run, if the following command is given and the
puppet.conf file contains `environment=dev`:

    puppet agent --test --noop

These facts will return:

    agent_specified_environment=dev
    agent_specified_environment_setbycli=False
    agent_specified_noop=True
    agent_specified_noop_setbycli=True
