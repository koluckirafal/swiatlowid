#!/usr/bin/python3

import os
import irc3

irc_nick = os.environ.get('IRC_NICK', 'swiatlowid')
irc_user = os.environ.get('IRC_USER', 'swiatlowid')
irc_host = os.environ.get('IRC_HOST', 'irc.pirc.pl')
irc_port = int(os.environ.get('IRC_PORT', '6697'))
irc_ssl = int(os.environ.get('IRC_SSL', '1'))
irc_join = os.environ.get('IRC_JOIN', '#swiatlowid').split(':')

config = dict(
    nick=irc_nick, username=irc_user,
    autojoins=irc_join,
    host=irc_host, port=irc_port, ssl=irc_ssl,
    includes=[
        'irc3.plugins.core',
        'irc3.plugins.command',
    ]
)

bot = irc3.IrcBot.from_config(config)
bot.run(forever=True)
