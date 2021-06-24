function shouldActivate() {
    return !!document.fullscreenElement || window.innerWidth == 1920 && window.innerHeight == 1080;
}

function onStopped() {

    if (shouldActivate()) {

        if (isViewPage) {

            window.close(); // openNext();
        }
    }
}

let vid = document.getElementsByTagName("video")[0];
let isSuggestionPage = window.location.href === "https://www.youtube.com/";
let isViewPage = window.location.href.indexOf("https://www.youtube.com/watch?v") === 0;
let isSearchPage = (window.location.href.indexOf("https://www.youtube.com/results?search_query=") === 0) ||
    (window.location.href === "https://www.youtube.com/feed/subscriptions");

function setupVid() {
    if (!!vid) {


        vid.addEventListener("ended", onStopped);
        vid.addEventListener("error", onStopped);
        vid.focus();
        vid.setAttribute("preload", "auto");
        vid.setAttribute("style", (vid.getAttribute("style") || "") + ";position:fixed !important;z-index:999999 !important;left:0 !important;top:0 !important;bottom:0 !important;right:0 !important;width:100% !important;height:100% !important;background-color:black;");
        let a = document.getElementById("masthead-container")
        if (!!a) {

            a.setAttribute("style", "display:none")
        }
        a = document.getElementById("related")
        if (!!a) {

            a.setAttribute("style", "display:none")
        }
    }
}

setTimeout(() => { setupVid(); }, 2000);

if (shouldActivate()) {

    if (isSearchPage || isSuggestionPage) {

        openVideoLinks();

    } else if (isViewPage && document.getElementsByClassName('ytp-offline-slate-main-text').length > 0) {

        window.close();
    }
}

function loadArray(name) {

    let u = localStorage[name];

    try {

        if (typeof u === "string" && u.length > 0) {

            u = JSON.parse(u);
        }

        if (!(typeof u === "object" && u instanceof Array)) {

            u = [];
        }

    } catch (e) {

        u = [];
    }

    return u;
}

function saveArray(arr, name) {

    try {
        while (arr.length > 50000) arr.splice(0, 1);
        localStorage[name] = JSON.stringify(arr);
    } catch (e) {
        try {
            localStorage.removeItem(name);
        } catch (e) {}
    }
}

let queuedTokens = loadArray("queuedTokens");
let seenTokens = loadArray("seenTokens");

function openVideoLinks() {
    setTimeout(
        function() {

            var a = document.getElementsByClassName("ytd-thumbnail");
            var t = 0;
            for (let i = a.length - 1; i >= 0; i--) {
                let b = a[i];
                if (b.id === "thumbnail") {
                    let c = b.getAttribute("href");
                    if (!!c && typeof c === "string" && c.indexOf("/watch?v") >= 0) {
                        c = "https://www.youtube.com" + c.replace("https://www.youtube.com", "");

                        let token = c.replace("https://www.youtube.com/watch?v=", "").split('&')[0];

                        if (seenTokens.indexOf(token) >= 0) continue;
                        seenTokens.push(token);
                        try {
                            saveArray(seenTokens, "seenTokens");
                        } catch (e) {}
                        queuedTokens.push(token);
                    }
                }
            }
            saveArray(queuedTokens, "queuedTokens");
            openNext();
        },

        4000
    );
}
let hidden = null;

if (typeof document.hidden !== "undefined") { // Opera 12.10 and Firefox 18 and later support
    hidden = "hidden";
} else if (typeof document["msHidden"] !== "undefined") {
    hidden = "msHidden";
} else if (typeof document["webkitHidden"] !== "undefined") {
    hidden = "webkitHidden";
}

function onVisibilityChanged(e) {

    if (!hidden) return;

    if (document[hidden]) {

        if (!!vid) {
            if (shouldActivate())
                vid.pause();
        }
    } else {

        seenTokens = loadArray("seenTokens");
        queuedTokens = loadArray("queuedTokens");

        if (isSuggestionPage || isSearchPage) {

            if (queuedTokens.length > 0) {

                openNext();
                return;
            }
        }

        if (isSuggestionPage) {

            window.location.reload();

        } else if (isSearchPage) {

            if (!!document.scrollingElement) {

                document.scrollingElement.scrollTop = document.scrollingElement.scrollHeight;
            }

            setTimeout(openVideoLinks, 2000);

        } else if (isViewPage) {

            if (!!vid) {

                if (vid.paused && shouldActivate()) {

                    vid.play();
                }
            }
        }
    }
}

let visibilityChange = null;

if (typeof document.hidden !== "undefined") { // Opera 12.10 and Firefox 18 and later support
    visibilityChange = "visibilitychange";
} else if (typeof document["msHidden"] !== "undefined") {
    visibilityChange = "msvisibilitychange";
} else if (typeof document["webkitHidden"] !== "undefined") {
    visibilityChange = "webkitvisibilitychange";
}

if (!!visibilityChange) {

    document.removeEventListener(visibilityChange, onVisibilityChanged);
    document.addEventListener(visibilityChange, onVisibilityChanged, { passive: false });
}

function openNext() {

    if (!shouldActivate()) {

        setTimeout(openNext, 1000);
        return;
    }

    let now = new Date().getTime() - 3600000;
    let expire = now + 31 * 24 * 3600 * 1000;
    localStorage["yt.autonav::autonav_disabled"] = JSON.stringify({ "data": true, "expiration": now, "creation": expire });
    localStorage["yt-player-quality"] = JSON.stringify({ "data": "hd2880", "expiration": now, "creation": expire });

    queuedTokens = loadArray("queuedTokens");

    if (queuedTokens.length === 0) {

        if (isViewPage) {

            window.close();
            return;
        }

        onVisibilityChanged();
        return;
    }

    if (!!hidden && document[hidden]) return;

    let c = "https://www.youtube.com/watch?v=" + queuedTokens.pop();
    saveArray(queuedTokens, "queuedTokens");

    if (isViewPage) {

        document.location.href = c;
        return;
    }

    setTimeout(function() {
        window.open(c, "_blank").blur();
        window.focus();
    }, 2000)
}

window.playNext = openNext;