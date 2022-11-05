data.more = false;
data.done = !!data.done ? data.done : [];

window.oayv = window["oayv"] || (function () {

    let data = {};
    let result = {};

    result.queueUrls = [];
    result.doneUrls = [];
    result.nowHidden = null;


    result.isSuggestionPage = window.location.href === 'https://www.youtube.com/';
    result.isSubscriptionsPage = window.location.href.indexOf('https://www.youtube.com/feed/subscriptions') === 0;
    result.isViewPage = window.location.href.indexOf('https://www.youtube.com/watch?v') === 0;
    result.isSearchPage = window.location.href.indexOf('https://www.youtube.com/results?search_query=') === 0;
    result.isWatchLaterPage = window.location.href.indexOf('https://www.youtube.com/playlist?list=WL') === 0;
    result.isShortsPage = window.location.href.indexOf('https://www.youtube.com/shorts/') === 0;

    result.fakeClick = function (anchorObj, event) {
        try {

            if (anchorObj.click) {
                anchorObj.click()
            } else if (document.createEvent) {
                if (!event || event.target !== anchorObj) {
                    var evt = document.createEvent("MouseEvents");
                    evt.initMouseEvent("click", true, true, window,
                        0, 0, 0, 0, 0, false, false, false, false, 0, null);
                    var allowDefault = anchorObj.dispatchEvent(evt);
                }
            }
        } catch (e) {
            debugger;
        }
    }

    if (typeof document.hidden !== "undefined") {
    } else if (typeof document["msHidden"] !== "undefined") {
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
        result.vid = document.getElementsByTagName("video")[0];

        if (!!result.vid) {

            result.vid.onended = () => { window.close() };
            result.vid.loop = false;
            result.vid.volume = 1;
        }

        if (!window.oayvInitialized) {

            window.oayvInitialized = true;

            document.removeEventListener("visibilitychange", result.onVisibilityChanged);
            document.addEventListener("visibilitychange", result.onVisibilityChanged, { passive: false });

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

                        if ((result.queueUrls.indexOf(c) < 0) && (result.doneUrls.indexOf(c) < 0)) {

                            result.queueUrls.push(c);
                        }
                    }
                }
            }

            if (result.isSuggestionPage || result.isSearchPage || result.isSubscriptionsPage || result.isWatchLaterPage) {

                data.more = result.queueUrls.length > 0;
                let a = document.getElementsByTagName('span');
                let i2 = 0;
                let list = [];
                while (result.queueUrls.length > 0 && i2++ < 5) {

                    let item = result.queueUrls.splice(0, 1)[0];
                    result.doneUrls.push(item);
                    list.push(item);
                }
                for (let b of list) {

                    window.open(b);
                }

                if (result.queueUrls.length === 0) {

                    if (!!document.scrollingElement && document.scrollingElement.scrollTop !== document.scrollingElement.scrollHeight) {

                        document.scrollingElement.scrollTop = document.scrollingElement.scrollHeight;

                        setTimeout(function () {
                            window.oayvInitialized = false;
                            result.initializePage();
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

        if (((result.isViewPage || result.isShortsPage) && !result.vid) || ((result.isSearchPage || result.isSubscriptionsPage || result.isSuggestionPage || result.isWatchLaterPage) && result.doneUrls.length + result.queueUrls.length === 0)) {
            result.vid = document.getElementsByTagName("video")[0];
            if (!!result.vid) {
                window.oayvInitialized = false;
                result.initializePage(dataObj);
            }
        }

        if ((result.isSearchPage || result.isSubscriptionsPage || result.isSuggestionPage || result.isWatchLaterPage) &&
            result.doneUrls.length + result.queueUrls.length === 0) {
            window.oayvInitialized = false;
            result.initializePage(dataObj);
        }

        if (!(result.isViewPage || result.isShortsPage)) {

            data.description = document.title;
            data.title = result.isSearchPage ? 'Search page' :
                result.isSuggestionPage ? 'Recommended' :
                    result.isSubscriptionsPage ? 'Subscriptions' :
                        result.isShortsPage ? 'Shorts' :
                            result.isWatchLaterPage ? 'Watch later' : 'Unknown page';
            data.subscribeTitle = '         ';
            data.playing = false;
            data.position = 0;
            data.duration = 0;
        }
        else {

            if (result.vid && (result.isViewPage || result.isShortsPage)) {

                result.vid.setAttribute('style', 'position:fixed;left:0;top:0;bottom:0;right:0;z-index:10000;width:100vw;height:100vh');

                if (!document.getElementById('genxbackground')) {

                    let div = document.createElement('div'); document.body.appendChild(div); div.setAttribute('style', 'position:fixed;left:0;top:0;bottom:0;right:0;z-index:9999;width:100vw;height:100vh;background-color:black;');
                    div.setAttribute('id', 'genxbackground');
                    document.body.appendChild(result.vid);
                    document.body.setAttribute('style', 'overflow:hidden');
                }

                result.vid.setAttribute('style', 'position:fixed;left:0;top:0;bottom:0;right:0;z-index:10000;width:100vw;height:100vh');
                data.playing = !result.vid.paused;
                data.position = result.vid.currentTime;
                data.duration = result.vid.duration;
            }
            else {
                data.playing = false;
                data.position = 0;
                data.duration = 0;
            }

            try { data.description = document.querySelector('#content').querySelector('#description').innerText; } catch { data.description = ''; }
            try { data.title = document.title; } catch { data.title = ''; }
            try { data.subscribeTitle = document.querySelector('#subscribe-button').innerText.trim(); } catch { data.subscribeTitle = '           ' }
        }
    }

    return result;
})();

window.oayv.initializePage(data);
