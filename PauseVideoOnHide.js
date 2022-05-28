if (window.pvoh === 1) return;
window.pvoh = 1;

let vid = document.getElementsByTagName("video")[0];
let isSuggestionPage = window.location.href === "https://www.youtube.com/";
let isViewPage = window.location.href.indexOf("https://www.youtube.com/watch?v") === 0;
let isSearchPage = (window.location.href.indexOf("https://www.youtube.com/results?search_query=") === 0) ||
    (window.location.href === "https://www.youtube.com/feed/subscriptions");

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

    vid = document.getElementsByTagName("video")[0];

    if (!hidden) return;

    if (document[hidden]) {

        if (!!vid) {

            vid.pause();
        }
        return;
    }

    if (isSuggestionPage) {

        window.location.reload();

        return;
    }

    if (isSearchPage) {

        if (!!document.scrollingElement) {

            document.scrollingElement.scrollTop = document.scrollingElement.scrollHeight+99999;
            setTimeout(() => {
                window.onceOnly = false;
            }, 1);
        }
        return;
    }

    if (!!vid) {

        vid.play();
    }
}

document.removeEventListener("visibilitychange", onVisibilityChanged);
document.addEventListener("visibilitychange", onVisibilityChanged, false);
