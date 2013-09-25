function VideoPlayer() {
}

VideoPlayer.prototype.show = function(message,mode) {
    cordova.exec(function(winParam) {},
                 function(error) {},
                 "VideoPlayer",
                 "show",
                 [message, mode]
                 );
};

VideoPlayer.install = function() {
    if (!window.plugins) {
        window.plugins = {};
    }
    
    window.plugins.videoPlayer = new VideoPlayer();
    return window.plugins.videoPlayer;
};

cordova.addConstructor(VideoPlayer.install);

