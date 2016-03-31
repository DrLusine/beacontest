# Presense Bot

The Presense Bot is a Slack bot that works together with Estimote beacons and the Presense iOS and Android apps.

iOS: https://github.com/chaychoong/presense
Android: https://github.com/jang93/PreSense_Android

### Prerequisite

To deploy this on your Slack team, you must firstly add a Bot to your Slack and set up a Heroku account. You will also need some Estimote beacons! To use the bot most effectively, you will need our iOS or Android app linked above.

### Installation instructions

* Click on your team name on the Slack web interface and select **Apps & integrations**. Alternatively, you can use this URL: https://slack.com/apps

* Search for "Bots" using the search bar and select the first option with the description "Connect a bot to the Slack Real Time Messaging API"

* Click on **Install** under your team name.

* Choose a username for your bot and select **Add Bot Integration**.

* Jot down the **API Token** generated. We will need this later.

* You can choose to customize the icon for the bot and add a name and description. Once you are done, hit **Save Integration**.

* Click on this button: [![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy?template=https://github.com/chaychoong/presensebot/tree/master)

* You will need a Heroku account to deploy the app. If you already have a Heroku account, log in at the bottom of the page.

* Once you have created an account, hit back and log in!

* Give your app a name. I know it says Optional, but you will need this for your configuration.

* Under Config Variables, insert your API Token under **HUBOT_SLACK_TOKEN** and set the **HEROKU_URL** to https://[App Name].herokuapp.com/

* Hit **Deploy for Free** and you are done!

### Running the bot

Use this URL on your Presense app: https://[heroku app name].herokuapp.com/hubot/notify/general

The bot listens to only one command: where is [name]. The bot will reply "[name] is available", "[name] is busy" or "[name] is not found", depending on the status of the username.

You can give the bot the "where is [name]" command by dropping it a Direct Message, or invite the bot into any Slack channel and tag it in your message, eg. "@botname: where is [name]"
