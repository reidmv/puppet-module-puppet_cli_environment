# puppet\_environment\_facts

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

### agent\_specified\_environment

This fact is NOT provided by this module, and is actually a fact built in to
Puppet. `agent_specified_environment` is relevant to most use cases this module
supports though, and prior to the fact being added to Puppet this module
provided an implementation. Now that it's a built in fact, see the
documentation for it [here](https://docs.puppet.com/puppet/latest/lang_facts_and_builtin_vars.html#puppet-agent-facts).

### agent\_specified\_environment\_setbycli

Boolean. Whether or not the environment setting was specified on the CLI (e.g.
`--environment=dev`).

### agent\_specified\_noop

Boolean. The agent-side value of the noop setting.

### agent\_specified\_noop\_setbycli

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

    agent_specified_environment=nil
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
