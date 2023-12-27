// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

contract Twitter {
    // define max tweet length
    uint16 public  MAX_TWEET_LENGTH = 280;
    // define our struct
    struct Tweet{
        uint256 id;
        address author;
        string content;
        uint256 timestamp;
        uint256 likes;
    }
    
    mapping (address => Tweet[]) public tweets;
    address public owner;
    constructor(){
        owner=msg.sender;
    }
    // define our event for creating a tweet called TweetCreated
    event TweetCreated(uint256 id, address author, string content, uint256 timestamp);
    
    function createTweet(string memory _tweet) public {
        // conditional
        // if tweet length<= 280 chars otherwise revert
        require(bytes(_tweet).length<=MAX_TWEET_LENGTH,"Tweet is too long!");
        Tweet memory newTweet = Tweet({
            id:tweets[msg.sender].length,
            author: msg.sender,
            content: _tweet,
            timestamp:block.timestamp,
            likes:0
        });
        tweets[msg.sender].push(newTweet);
        // use the event here
        emit TweetCreated(newTweet.id,newTweet.author,newTweet.content,newTweet.timestamp);

    }
    // define an event for liking the tweet called TweetLiked
    event TweetLiked(address liker, address tweetauthor, uint256 id, uint256 newLikeCount); 
    //function to like a tweet
    function likeTweet(address author, uint256 id) external  {
        require(tweets[author][id].id == id, "Tweet doesn't exist");
        tweets[author][id].likes++;

        emit TweetLiked(msg.sender, author, id, tweets[author][id].likes);
    }

    // define an event for unliking the tweet called TweetUnliked
    event TweetUnliked(address unliker, address tweetauthor, uint256 id, uint256 newLikeCount);
    // function to unlike the tweet if a like already exists
    function unlikeTweet(address author, uint256 id) external {
        require(tweets[author][id].id == id, "Tweet doesn't exist");
        require(tweets[author][id].likes>0, "There's no like for it");
        tweets[author][id].likes--;

        emit TweetUnliked(msg.sender, author, id, tweets[author][id].likes);
    }
    function getTweet( uint _i) public view returns  (Tweet memory){
        return tweets[msg.sender][_i];
    }
    function getAllTweets(address _owner) public view returns (Tweet[] memory){
        return tweets[_owner];
    }

    //create a modifier that uses only the owner to change some secret functions
    modifier onlyOwner(){
        require(msg.sender==owner, "You're not allowed to change this, sorry, only owner can!");
        _;
    }
    //function to change maxtweetlength
    function changeTweetLength(uint16 newTweetLength) public onlyOwner{
        MAX_TWEET_LENGTH = newTweetLength;
    }

    //function to get total likes for the user
    function getTotalLikes(address _author) external view returns(uint) {
        uint totalLikes;

        for( uint i = 0; i < tweets[_author].length; i++){
            totalLikes += tweets[_author][i].likes;
        }

        return totalLikes;
    }
}