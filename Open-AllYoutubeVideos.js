
data.more = false;
data.done = !!data.done ? data.done : [];
data.urls = [];
window.queueUrls = !!window.queueUrls ? window.queueUrls : [];

let vid = document.getElementsByTagName("video")[0];
let isSuggestionPage = window.location.href === "https://www.youtube.com/";
let isViewPage = window.location.href.indexOf("https://www.youtube.com/watch?v") === 0;
let isSearchPage = (window.location.href.indexOf("https://www.youtube.com/results?search_query=") === 0) ||
    (window.location.href === "https://www.youtube.com/feed/subscriptions");

function fakeClick(anchorObj, event) {
    try {

        if (anchorObj.click) {
            anchorObj.click()
        } else if (document.createEvent) {
            if (!event || event.target !== anchorObj) {
                var evt = document.createEvent("MouseEvents");
                evt.initMouseEvent("click", true, true, window,
                    0, 0, 0, 0, 0, false, false, false, false, 0, null);
                var allowDefault = anchorObj.dispatchEvent(evt);
                // you can check allowDefault for false to see if
                // any handler called evt.preventDefault().
                // Firefox will *not* redirect to anchorObj.href
                // for you. However every other browser will.
            }
        }
    } catch (e) {
        debugger;
    }
}

let hidden = null;

if (typeof document.hidden !== "undefined") { // Opera 12.10 and Firefox 18 and later support
    hidden = "hidden";
} else if (typeof document["msHidden"] !== "undefined") {
    hidden = "msHidden";
} else if (typeof document["webkitHidden"] !== "undefined") {
    hidden = "webkitHidden";
}

let visibilityChange = null;

if (typeof document.hidden !== "undefined") { // Opera 12.10 and Firefox 18 and later support
    visibilityChange = "visibilitychange";
} else if (typeof document["msHidden"] !== "undefined") {
    visibilityChange = "msvisibilitychange";
} else if (typeof document["webkitHidden"] !== "undefined") {
    visibilityChange = "webkitvisibilitychange";
}

function onVisibilityChanged(e) {

    if (!hidden) return;

    if (document[hidden]) {

    } else {

        let a = document.getElementsByTagName('span');
        let i2 = 0;
        let list = [];
        while (window.queueUrls.length > 0 && i2++ < 10) {

            list.push(window.queueUrls.splice(0, 1)[0]);
        }
        for (let b of list) {

            window.open(b);
        }

        if (window.queueUrls.length === 0) {

            if (isSuggestionPage) {

                window.location.reload();

            } else if (isSearchPage) {

                if (!!document.scrollingElement) {

                    document.scrollingElement.scrollTop = document.scrollingElement.scrollHeight;
                    setTimeout(() => {
                        window.onceOnly = false;
                    }, 1);
                }
            } else if (isViewPage) {

                if (!!vid) {

                    if (vid.paused && shouldActivate()) {

                        vid.play();
                    }
                }
            }
        }

        data.more = window.queueUrls.length > 0;
    }
}

if (!window.onceOnly) {

    window.onceOnly = true;
    document.removeEventListener("visibilitychange", onVisibilityChanged);
    document.addEventListener("visibilitychange", onVisibilityChanged, { passive: false });

    let a = document.getElementsByClassName("ytd-thumbnail");
    let t = 0;
    let i2 = 0;
    let list = [];
    for (let i = a.length - 1; i >= 0; i--) {
        let b = a[i];
        if (b.id === "thumbnail") {
            let c = b.getAttribute("href");
            if (!!c && typeof c === "string" && c.indexOf("/watch?v") >= 0) {
                c = "https://www.youtube.com" + c.replace("https://www.youtube.com", "");

                if (i2++ < 10) {
                    list.push(c);
                } else {
                    window.queueUrls.push(c);
                }
            }
        }
    }

    for (let b of list) {

        window.open(b);
    }

}

data.more = window.queueUrls.length > 0;
