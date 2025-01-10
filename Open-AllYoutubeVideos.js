let first = !window["oayv"];

window.oayv = window["oayv"] || (function (data) {

    let tmpResult = {};
    data = data || {};

    tmpResult.queueUrls = [];
    let doneUrls = !!localStorage["oaytDone"] ? JSON.parse(localStorage["oaytDone"]) : JSON.parse((localStorage["oaytDone"] = JSON.stringify([])));
    tmpResult.nowHidden = null;

    tmpResult.isSuggestionPage = window.location.href === 'https://www.youtube.com/';
    tmpResult.isSubscriptionsPage = window.location.href.indexOf('https://www.youtube.com/feed/subscriptions') === 0;
    tmpResult.isViewPage = window.location.href.indexOf('https://www.youtube.com/watch?v') === 0;
    tmpResult.isSearchPage = window.location.href.indexOf('https://www.youtube.com/results?search_query=') === 0;
    tmpResult.isWatchLaterPage = window.location.href.indexOf('https://www.youtube.com/playlist?list=WL') === 0;
    tmpResult.isShortsPage = window.location.href.indexOf('https://www.youtube.com/shorts/') === 0;
    tmpResult.isTrendingPage = window.location.href.indexOf('https://www.youtube.com/feed/trending') === 0;

    if (typeof document.hidden !== "undefined") {
        tmpResult.nowHidden = document.hidden;
    } else if (typeof document["msHidden"] !== "undefined") {
        tmpResult.nowHidden = document.msHidden;
    } else if (typeof document["webkitHidden"] !== "undefined") {
        tmpResult.nowHidden = document.webkitHidden;
    }

    visibilityChange = "hidden";

    if (typeof document.visibilitychange !== "undefined") {
        visibilityChange = "visibilitychange";
    } else if (typeof document["msvisibilitychange"] !== "undefined") {
        visibilityChange = "msvisibilitychange";
    } else if (typeof document["webkitvisibilitychange"] !== "undefined") {
        visibilityChange = "webkitvisibilitychange";
    } else if (typeof document["msvisibilitychange"] !== "undefined") {
        visibilityChange = "msvisibilitychange";
    } else if (typeof document["webkitHidden"] !== "undefined") {
        visibilityChange = "webkitHidden";
    }

    document.addEventListener(visibilityChange, function (e) {

        if (document[visibilityChange]) {
            let vid = document.querySelector('video');
            if (!!vid && !vid.paused) {

                vid.pause();
            }

        } else {

            window.oayvInitialized = false;
            window.oayv.initializePage(data);
        }
    }, false);
    tmpResult.fakeClick = function (anchorObj, event) {
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
    tmpResult.togglePauseVideo = function () {

        let video = document.querySelector('video');
        if (video.paused) {
            video.play();
        }
        else {
            video.pause();
        }
        data.playing = !video.paused;
        data.position = video.currentTime;
        data.duration = video.duration;
    };

    tmpResult.toggleSubscribeToChannel = function () {

        window.oayv.fakeClick(document.querySelector('ytd-subscribe-button-renderer'));
        window.oayv.fakeClick(document.querySelector('#confirm-button tp-yt-paper-button'));
        window.oayv.fakeClick(document.querySelector('tp-yt-paper-button[dialog-confirm]'));
    };

    tmpResult.setVideoPosition = function (n) {

        let video = document.querySelector('video');
        video.currentTime = Math.round(video.duration * (n / 10));
        video.play();
        data.playing = !video.paused;
        data.position = video.currentTime;
        data.duration = video.duration;
    };

    tmpResult.backwardsInVideo = function () {

        let video = document.querySelector('video');
        video.currentTime = Math.min(video.duration, video.currentTime - 20);
        video.play();
        data.playing = !video.paused;
        data.position = video.currentTime;
        data.duration = video.duration;
    };

    tmpResult.forwardInVideo = function () {
        let video = document.querySelector('video');
        video.currentTime = Math.min(video.duration, video.currentTime + 20);
        video.play();
        data.playing = !video.paused;
        data.position = video.currentTime;
        data.duration = video.duration;
    };

    tmpResult.initializePage = function (data) {

        data.isSuggestionPage = window.location.href === 'https://www.youtube.com/';
        data.isSubscriptionsPage = window.location.href.indexOf('https://www.youtube.com/feed/subscriptions') === 0;
        data.isViewPage = window.location.href.indexOf('https://www.youtube.com/watch?v') === 0;
        data.isSearchPage = window.location.href.indexOf('https://www.youtube.com/results?search_query=') === 0;
        data.isWatchLaterPage = window.location.href.indexOf('https://www.youtube.com/playlist?list=WL') === 0;
        data.isShortsPage = window.location.href.indexOf('https://www.youtube.com/shorts/') === 0;
        data.isTrendingPage = window.location.href.indexOf('https://www.youtube.com/feed/trending') === 0;

        let vid = document.querySelector('video');
        if (!data.originalSource) data.originalSource = vid.currentSrc;
        vid.onended = () => { window.close() };
        vid.loop = false;
        vid.volume = 1;
        vid.onprogress = (event) => {

            let position = vid.currentTime;
            let duration = vid.duration;
            let left = duration - position;

            if (left < 2) {

                window.close();
            }
        };

        if (!window.oayvInitialized) {

            window.oayvInitialized = true;

            document.removeEventListener("visibilitychange", tmpResult.onVisibilityChanged);
            document.addEventListener("visibilitychange", tmpResult.onVisibilityChanged, { passive: false });
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

                        if ((tmpResult.queueUrls.indexOf(c) < 0) && (doneUrls.indexOf(c) < 0)) {

                            tmpResult.queueUrls.push(c);
                        }
                    }
                }
            }
            if (tmpResult.isSuggestionPage || tmpResult.isSearchPage || tmpResult.isSubscriptionsPage || tmpResult.isWatchLaterPage || tmpResult.isTrendingPage) {

                data.more = tmpResult.queueUrls.length > 0;
                let a = document.getElementsByTagName('span');
                let i2 = 0;
                let list = [];
                while (tmpResult.queueUrls.length > 0 && i2++ < 5) {

                    let item = tmpResult.queueUrls.splice(0, 1)[0];
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

                if (tmpResult.queueUrls.length === 0) {

                    if (!!document.scrollingElement && document.scrollingElement.scrollTop !== document.scrollingElement.scrollHeight) {

                        window.scrollTo(0, document.body.scrollHeight);

                        setTimeout(function () {
                            window.oayvInitialized = false;
                            tmpResult.initializePage(data);
                        }, 1000);
                    }
                }

                data.more = tmpResult.queueUrls.length > 0;

            } else if (tmpResult.isViewPage || tmpResult.isShortsPage) {

                let vid = document.querySelector('video');
                if (!!vid) {

                    if (vid.paused) {

                        vid.play();
                    }

                    vid.volume = 1;
                }
            }
        }
    }

    tmpResult.updatePage = function (dataObj) {

        data = dataObj;
        let vid = document.querySelector('video');
        if (((tmpResult.isViewPage || tmpResult.isShortsPage) && !vid) || ((tmpResult.isSearchPage || tmpResult.isSubscriptionsPage || tmpResult.isSuggestionPage || tmpResult.isWatchLaterPage || tmpResult.isTrendingPage) && doneUrls.length + tmpResult.queueUrls.length === 0)) {
            vid = document.querySelector('video');
            if (!!vid) {
                window.oayvInitialized = false;
                tmpResult.initializePage(data);
            }
        }

        if ((tmpResult.isSearchPage || tmpResult.isSubscriptionsPage || tmpResult.isSuggestionPage || tmpResult.isWatchLaterPage || tmpResult.isTrendingPage) &&
            doneUrls.length + tmpResult.queueUrls.length === 0) {
            window.oayvInitialized = false;
            tmpResult.initializePage(data);
        }

        if (!(tmpResult.isViewPage || tmpResult.isShortsPage)) {

            data.description = document.title;
            data.title = tmpResult.isSearchPage ? 'Search page' :
                tmpResult.isSuggestionPage ? 'Recommended' :
                    tmpResult.isSubscriptionsPage ? 'Subscriptions' :
                        tmpResult.isShortsPage ? 'Shorts' :
                            tmpResult.isWatchLaterPage ? 'Watch later' :
                                tmpResult.isTrendingPage ? "Trending" : 'Unknown page';
            data.subscribeTitle = '         ';
            data.playing = false;
            data.position = 0;
            data.duration = 0;
        } else {

            if (vid && (tmpResult.isViewPage || tmpResult.isShortsPage)) {

                let myref = new URLSearchParams(window.location.search).get('myref');
                if (!!myref && myref.length > 0) {

                    doneUrls = !!localStorage["oaytDone"] ? JSON.parse(localStorage["oaytDone"]) : JSON.parse((localStorage["oaytDone"] = JSON.stringify([])));
                    doneUrls.push(myref);
                    while (doneUrls.length > 1000) doneUrls.splice(0, 1);
                    localStorage["oaytDone"] = JSON.stringify(doneUrls);
                }

                vid.setAttribute('style', 'position:fixed;left:50%;top:50%;transform:translate(-50%,-50%);z-index:99999;width:100vw;height:100vh;object-fit:contain;background-color:black;');

                try {
                    document.querySelector("#secondary").setAttribute("style", "display:none;opacity:0;");
                    document.querySelector("#masthead").setAttribute("style", "display:none;opacity:0;");
                    document.querySelector("#below").setAttribute("style", "display:none;opacity:0;");
                    document.body.setAttribute("style", "overflow:hidden;color:black;")
                    // Assuming 'e' is your element
                    let e = vid;

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

                data.playing = !vid.paused;
                data.position = vid.currentTime;
                data.duration = vid.duration;
                data.originalSource = tmpResult.originalSource;
                data.currentSource = vid.currentSrc;

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

    tmpResult.initializePage(data);

    return tmpResult;
})(data);

while (first && !data.done) {

    await new Promise(r => setTimeout(r, 100));
    window.oayv.updatePage(data);

    yield data;
}
