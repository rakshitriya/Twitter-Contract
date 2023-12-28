# Twitter Contract 🕊️

Welcome to the Twitter Contract! This Solidity smart contract allows users to create tweets, add likes, retrieve information about tweets and generate notifications. Let's explore the features step by step.

## Overview

The Basic Twitter Contract is a simple Ethereum smart contract written in Solidity. It provides basic functionality to emulate a simplified version of the Twitter platform on the blockchain. Users can create tweets, add likes to tweets, and interact with the contract through various functions.

## Features

1. **Mappings** - Solidity mappings are utilized to store tweets and their associated likes. We have a mapping between the address(owner) and the tweets by that address(owner). Variable named "tweets".
2. **Structs** - Solidity structs are used to structurize tweet data more effectively. A tweet may contain fields like id, author, content, likes, timestamp, etc. Hence, a struct called "Tweet" is created to store the same info for a single tweet.
3. **Arrays** - Solidity arrays are introduced to store the tweets by a user. This feature enhances the contract's capability to store multiple tweets by a single user. Variable named "Tweet[]".
4. **Used** `require` - The `require` statement is employed to add conditions to functions, ensuring that certain criteria are met before executing specific actions. A requirement is added to limit the length of tweets, ensuring that tweets are within a reasonable character limit. Similarly, `require` is also used to check if a particular tweet exists or not, before liking or unliking it.
5. **Modifiers** - Modifiers are implemented to enhance security and efficiency. A custom modifier, say `onlyOwner`, is introduced to check if the caller is the author of a particular function called `changeTweetLength`.
6. **Loops** - Loops have been used to find out the total likes gathered by an author on all of their tweets.
7. **Events** - Added events (_notifications for blockchain_) which would be emitted when a tweet gets liked or unliked, after certain requirements get fulfilled.

## Happy tweeting on the blockchain! 🚀
