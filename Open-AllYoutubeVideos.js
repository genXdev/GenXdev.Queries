data.more = false;
data.done = !!data.done ? data.done : [];

window.oayv = window["oayv"] || (function () {

    let data = {};
    let result = {};

    result.queueUrls = [];
    let doneUrls = !!localStorage["oaytDone"] ? JSON.parse(localStorage["oaytDone"]) : JSON.parse((localStorage["oaytDone"] = JSON.stringify([])));
    result.nowHidden = null;

    result.isSuggestionPage = window.location.href === 'https://www.youtube.com/';
    result.isSubscriptionsPage = window.location.href.indexOf('https://www.youtube.com/feed/subscriptions') === 0;
    result.isViewPage = window.location.href.indexOf('https://www.youtube.com/watch?v') === 0;
    result.isSearchPage = window.location.href.indexOf('https://www.youtube.com/results?search_query=') === 0;
    result.isWatchLaterPage = window.location.href.indexOf('https://www.youtube.com/playlist?list=WL') === 0;
    result.isShortsPage = window.location.href.indexOf('https://www.youtube.com/shorts/') === 0;
    result.isTrendingPage = window.location.href.indexOf('https://www.youtube.com/feed/trending') === 0;

    if (typeof document.hidden !== "undefined") { } else if (typeof document["msHidden"] !== "undefined") {
        result.nowHidden = "msHidden";
    } else if (typeof document["webkitHidden"] !== "undefined") {
        result.nowHidden = "webkitHidden";
    }

    let visibilityChange = null;

    if (typeof document.hidden !== "undefined") {
        visibilityChange = "visibilitychange";
    } else if (typeof document["msHidden"] !== "undefined") {
        visibilityChange = "msvisibilitychange";
    } else if (typeof document["webkitHidden"] !== "undefined") {
        visibilityChange = "webkitvisibilitychange";
    }

    result.onVisibilityChanged = function (e) {

        if (document.hidden) {

            if (!!result.vid && !result.vid.paused) {

                result.vid.pause();
            }

        } else {

            window.oayvInitialized = false;
            result.initializePage(data);
        }
    }

    result.initializePage = function (dataObj) {

        data = dataObj;

        window.fakeClick = function (anchorObj, event) {
            try {

                if (!!anchorObj.click && !!anchorObj.mousedown() && !!anchorObj.mouseup && !!anchorObj.tap) {
                    try { anchorObj.touchStart(); } catch (e) { }
                    try { anchorObj.mousedown(); } catch (e) { }
                    try { anchorObj.mouseup(); } catch (e) { }
                    try { anchorObj.touchEnd(); } catch (e) { }
                    try { anchorObj.click(); } catch (e) { }
                    try { anchorObj.tap(); } catch (e) { }
                } else if (document.createEvent) {
                    if (!event || event.target !== anchorObj) {
                        try {
                            let evt = document.createEvent("TouchEvents");
                            evt.initMouseEvent("touchstart", true, true, window, 0, 0, 0, 0, 0, false, false, false, false, 0, null);
                            let allowDefault = anchorObj.dispatchEvent(evt);
                        } catch (e) { }
                        try {
                            let evt = document.createEvent("MouseEvents");
                            evt.initMouseEvent("mousedown", true, true, window, 0, 0, 0, 0, 0, false, false, false, false, 0, null);
                            let allowDefault = anchorObj.dispatchEvent(evt);
                        } catch (e) { }
                        try {
                            let evt = document.createEvent("MouseEvents");
                            evt.initMouseEvent("mouseup", true, true, window, 0, 0, 0, 0, 0, false, false, false, false, 0, null);
                            let allowDefault = anchorObj.dispatchEvent(evt);
                        } catch (e) { }
                        try {
                            let evt = document.createEvent("TouchEvents");
                            evt.initMouseEvent("touchend", true, true, window, 0, 0, 0, 0, 0, false, false, false, false, 0, null);
                            let allowDefault = anchorObj.dispatchEvent(evt);
                        } catch (e) { }
                        try {
                            let evt = document.createEvent("MouseEvents");
                            evt.initMouseEvent("click", true, true, window, 0, 0, 0, 0, 0, false, false, false, false, 0, null);

                            let allowDefault = anchorObj.dispatchEvent(evt);
                        } catch (e) { }
                        try {
                            let evt = document.createEvent("MouseEvents");
                            evt.initMouseEvent("tap", true, true, window, 0, 0, 0, 0, 0, false, false, false, false, 0, null);
                            let allowDefault = anchorObj.dispatchEvent(evt);
                        } catch (e) { }
                    }
                }
            } catch (e) { }
        };

        window.togglePauseVideo = function () {
            window.video = document.getElementsByTagName('video')[0];
            if (window.video.paused) {
                window.video.play();
            }
            else {
                window.video.pause();
            }
            data.playing = !window.video.paused;
            data.position = window.video.currentTime;
            data.duration = window.video.duration;
        };

        window.toggleSubscribeToChannel = function () {
            fakeClick(document.querySelector('ytd-subscribe-button-renderer'));
            fakeClick(document.querySelector('#confirm-button tp-yt-paper-button'));
            fakeClick(document.querySelector('tp-yt-paper-button[dialog-confirm]'));
        };

        window.setVideoPosition = function (n) {
            window.video = document.getElementsByTagName('video')[0];
            window.video.currentTime = Math.round(window.video.duration * (n / 10));
            window.video.play();
            data.playing = !window.video.paused;
            data.position = window.video.currentTime;
            data.duration = window.video.duration;
        };

        window.backwardsInVideo = function () {

            window.video = document.getElementsByTagName('video')[0];
            window.video.currentTime = Math.min(window.video.duration, window.video.currentTime - 20);
            window.video.play();
            data.playing = !window.video.paused;
            data.position = window.video.currentTime;
            data.duration = window.video.duration;
        };

        window.forwardInVideo = function () {
            window.video = document.getElementsByTagName('video')[0];
            window.video.currentTime = Math.min(window.video.duration, window.video.currentTime + 20);
            window.video.play();
            data.playing = !window.video.paused;
            data.position = window.video.currentTime;
            data.duration = window.video.duration;
        };

        result.vid = document.getElementsByTagName("video")[0];
        result.isSuggestionPage = window.location.href === 'https://www.youtube.com/';
        result.isSubscriptionsPage = window.location.href.indexOf('https://www.youtube.com/feed/subscriptions') === 0;
        result.isViewPage = window.location.href.indexOf('https://www.youtube.com/watch?v') === 0;
        result.isSearchPage = window.location.href.indexOf('https://www.youtube.com/results?search_query=') === 0;
        result.isWatchLaterPage = window.location.href.indexOf('https://www.youtube.com/playlist?list=WL') === 0;
        result.isShortsPage = window.location.href.indexOf('https://www.youtube.com/shorts/') === 0;
        result.isTrendingPage = window.location.href.indexOf('https://www.youtube.com/feed/trending') === 0;

        if (!!result.vid) {
            if (!result.originalSource) result.originalSource = result.vid.currentSrc;
            result.vid.onended = () => { window.close() };
            result.vid.loop = false;
            result.vid.volume = 1;
            result.vid.onprogress = (event) => {

                let position = result.vid.currentTime;
                let duration = result.vid.duration;
                let left = duration - position;

                if (left < 2) {

                    window.close();
                }
            };
        }

        if (!window.oayvInitialized) {

            window.oayvInitialized = true;

            document.removeEventListener("visibilitychange", result.onVisibilityChanged);
            document.addEventListener("visibilitychange", result.onVisibilityChanged, { passive: false });
            doneUrls = !!localStorage["oaytDone"] ? JSON.parse(localStorage["oaytDone"]) : JSON.parse((localStorage["oaytDone"] = JSON.stringify([])));

            let a = document.getElementsByClassName("ytd-thumbnail");
            let t = 0;
            let i2 = 0;
            let list = [];
            for (let i = 0; i < a.length; i++) {
                let b = a[i];
                if (b.id === "thumbnail") {
                    let c = b.getAttribute("href");
                    if (!!c && typeof c === "string" &&
                        (c.indexOf("/watch?v") >= 0 || c.indexOf("/short/") >= 0)) {

                        c = "https://www.youtube.com" + c.replace("https://www.youtube.com", "");

                        if ((result.queueUrls.indexOf(c) < 0) && (doneUrls.indexOf(c) < 0)) {

                            result.queueUrls.push(c);
                        }
                    }
                }
            }
            if (result.isSuggestionPage || result.isSearchPage || result.isSubscriptionsPage || result.isWatchLaterPage || result.isTrendingPage) {

                data.more = result.queueUrls.length > 0;
                let a = document.getElementsByTagName('span');
                let i2 = 0;
                let list = [];
                while (result.queueUrls.length > 0 && i2++ < 5) {

                    let item = result.queueUrls.splice(0, 1)[0];
                    list.splice(0, 0, item);
                }

                for (let b of list) {

                    let c = b;
                    if (c.indexOf("?") < 0) {
                        c = c + "?myref=" + encodeURIComponent(b);
                    }
                    else {
                        c = c + "&myref=" + encodeURIComponent(b);
                    }

                    doneUrls.push(b);
                    window.open(c);
                }

                if (result.queueUrls.length === 0) {

                    if (!!document.scrollingElement && document.scrollingElement.scrollTop !== document.scrollingElement.scrollHeight) {

                        window.scrollTo(0, document.body.scrollHeight);

                        setTimeout(function () {
                            window.oayvInitialized = false;
                            result.initializePage(data);
                        }, 1000);
                    }
                }

                data.more = result.queueUrls.length > 0;

            } else if (result.isViewPage || result.isShortsPage) {

                if (!!result.vid) {

                    if (result.vid.paused) {

                        result.vid.play();
                    }

                    result.vid.volume = 1;
                }
            }
        }
    }

    result.updatePage = function (dataObj) {

        data = dataObj;

        if (((result.isViewPage || result.isShortsPage) && !result.vid) || ((result.isSearchPage || result.isSubscriptionsPage || result.isSuggestionPage || result.isWatchLaterPage || result.isTrendingPage) && doneUrls.length + result.queueUrls.length === 0)) {
            result.vid = document.getElementsByTagName("video")[0];
            if (!!result.vid) {
                window.oayvInitialized = false;
                result.initializePage(data);
            }
        }

        if ((result.isSearchPage || result.isSubscriptionsPage || result.isSuggestionPage || result.isWatchLaterPage || result.isTrendingPage) &&
            doneUrls.length + result.queueUrls.length === 0) {
            window.oayvInitialized = false;
            result.initializePage(data);
        }

        if (!(result.isViewPage || result.isShortsPage)) {

            data.description = document.title;
            data.title = result.isSearchPage ? 'Search page' :
                result.isSuggestionPage ? 'Recommended' :
                    result.isSubscriptionsPage ? 'Subscriptions' :
                        result.isShortsPage ? 'Shorts' :
                            result.isWatchLaterPage ? 'Watch later' :
                                result.isTrendingPage ? "Trending" : 'Unknown page';
            data.subscribeTitle = '         ';
            data.playing = false;
            data.position = 0;
            data.duration = 0;
        } else {

            if (result.vid && (result.isViewPage || result.isShortsPage)) {

                let myref = new URLSearchParams(window.location.search).get('myref');
                if (!!myref && myref.length > 0) {

                    doneUrls = !!localStorage["oaytDone"] ? JSON.parse(localStorage["oaytDone"]) : JSON.parse((localStorage["oaytDone"] = JSON.stringify([])));
                    doneUrls.push(myref);
                    while (doneUrls.length > 1000) doneUrls.splice(0, 1);
                    localStorage["oaytDone"] = JSON.stringify(doneUrls);
                }

                result.vid.setAttribute('style', 'position:fixed;left:0;top:0;bottom:0;right:0;z-index:99999;min-width:100%;min-height:100%');
                try {
                    document.querySelector("#secondary").setAttribute("style", "display:none;opacity:0;");
                    document.querySelector("#masthead").setAttribute("style", "display:none;opacity:0;");
                    document.querySelector("#below").setAttribute("style", "display:none;opacity:0;");
                    document.body.setAttribute("style", "overflow:hidden;")
                    // Assuming 'e' is your element
                    let e = result.vid;

                    // Get the parent of the element
                    let parent = e.parentNode.parentNode;

                    // Get all the children of the parent
                    let children = Array.from(parent.children);

                    // Loop through the children
                    for (let i = 0; i < children.length; i++) {
                        // If the child is not the element 'e', add the CSS style
                        if (children[i] !== e.parentNode) {
                            children[i].style.display = 'none';
                            children[i].style.opacity = '0';
                        }
                    }

                } catch (e) { }

                data.playing = !result.vid.paused;
                data.position = result.vid.currentTime;
                data.duration = result.vid.duration;
                data.originalSource = result.originalSource;
                data.currentSource = result.vid.currentSrc;

                if (isNaN(data.duration)) {

                    if (!data.timer) {
                        data.timer = setTimeout(() => {
                            window.close();
                        }, 60000);
                    }
                }
                else {

                    if (!isNaN(data.duration) && data.playing && data.duration - data.position < 3) {
                        if (data.originalSource == data.currentSource) {
                            if (!data.timer) {
                                data.timer = setTimeout(() => {
                                    window.close();
                                }, 3500);
                            }
                        }
                    }
                    else {
                        if (!!data.timer) {

                            clearTimeout(data.timer);
                            data.timer = 0;
                        }
                    }
                }
            } else {
                data.playing = false;
                data.position = 0;
                data.duration = 0;
            }

            try { data.description = document.querySelector('#content').querySelector('#description').innerText; } catch { data.description = ''; }
            try { data.title = document.title; } catch { data.title = ''; }
            try { data.subscribeTitle = document.querySelectorAll('#subscribe-button span.yt-core-attributed-string.yt-core-attributed-string--white-space-no-wrap[role="text"]')[1].innerText.trim(); } catch { data.subscribeTitle = '           ' }
        }
    }

    return result;
})();

window.oayv.initializePage(data);