/*
 * YouTube Video Manager Script
 *
 * Manages automatic playback, fullscreen control, and video queue management for YouTube.
 * Handles multiple page types (home, search, subscriptions, etc.) and maintains video state
 * across page visibility changes.
 */

// Get base URL dynamically from current location
const YOUTUBE_BASE_URL = document.location.protocol + '//' + document.location.hostname;

// Storage key definitions to maintain consistent state management
const STORAGE_KEYS = {
    QUEUED: 'oaytvQueued',
    DONE: 'oaytvDone',
    LOCALDONE: 'oaytvLocalDone',
    RESUMED: 'oayvresumed',
    INITIALIZED: 'oayv',
    VIDEO_INITIALIZED: 'oayvvc',
    PAGESCANNED: 'oayvps'
};

// Script initialization state management
let first = sessionStorage[STORAGE_KEYS.INITIALIZED] !== "true";
let pageScanned = sessionStorage[STORAGE_KEYS.PAGESCANNED] === "true";
sessionStorage[STORAGE_KEYS.PAGESCANNED] = "true";

// Script initialization state management
let second = !first && sessionStorage[STORAGE_KEYS.RESUMED] !== "true";
if (second) { sessionStorage[STORAGE_KEYS.RESUMED] = "true"; }

// Initialize data with proper defaults
data = data || {};
data.open = data.open || [];
data.playing = data.playing || false;
data.position = data.position || 0;
data.duration = data.duration || 0;
data.timer = data.timer || null;
data.isFullscreen = !!document.fullscreenElement;
data.originalSource = data.originalSource || null;

// Initialize page type indicators
data.isSuggestionPage = window.location.href === YOUTUBE_BASE_URL + '/';
data.isSubscriptionsPage = window.location.href.startsWith(YOUTUBE_BASE_URL + '/feed/subscriptions');
data.isViewPage = window.location.href.indexOf(YOUTUBE_BASE_URL + '/watch?v') === 0;
data.isSearchPage = window.location.href.indexOf(YOUTUBE_BASE_URL + '/results?search_query=') === 0;
data.isWatchLaterPage = window.location.href.indexOf(YOUTUBE_BASE_URL + '/playlist?list=WL') === 0;
data.isShortsPage = window.location.href.indexOf(YOUTUBE_BASE_URL + '/shorts/') === 0;
data.isTrendingPage = window.location.href.indexOf(YOUTUBE_BASE_URL + '/feed/trending') === 0;

// Load storage data with error handling
let queueUrls = [], doneUrls = []; localDoneUrls = [];
try {
    queueUrls = JSON.parse(sessionStorage[STORAGE_KEYS.QUEUED] || '[]');
    doneUrls = JSON.parse(localStorage[STORAGE_KEYS.DONE] || '[]');
    localDoneUrls = JSON.parse(localStorage[STORAGE_KEYS.LOCALDONE] || '[]');
} catch (e) {
    console.error('Storage parsing error:', e);
    queueUrls = [];
    doneUrls = [];
}

localStorage[STORAGE_KEYS.DONE] = "[]";
doneUrls = [];

/*
 * Simulates natural user interaction by triggering a sequence of DOM events
 * Attempts multiple event dispatch methods to ensure cross-browser compatibility
 */
async function fakeClick(anchorObj, event) {
    // console.log('fakeClick');
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

                await new Promise(r => setTimeout(r, Math.round(Math.random() * 200) + 250));

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
                await new Promise(r => setTimeout(r, Math.round(Math.random() * 200) + 250));
            }
        }
    } catch (e) { }
};

/*
 * Video Fullscreen Management Functions
 * These functions handle entering, exiting, and toggling fullscreen state
 * while maintaining consistent state tracking
 */
async function setFullscreenVideo() {
    // console.log('setFullscreenVideo');
    const video = document.querySelector('video');
    if (!video || document.fullscreenElement) return;

    try {
        if (video.requestFullscreen) {
            await video.requestFullscreen();
        } else if (video.webkitRequestFullscreen) {
            await video.webkitRequestFullscreen();
        } else if (video.msRequestFullscreen) {
            await video.msRequestFullscreen();
        }
    } catch (e) {
        console.error('Error entering fullscreen:', e);
    }

    data.isFullscreen = !!document.fullscreenElement;
}

/**
 * Exits fullscreen mode
 */
async function unsetFullscreenVideo() {
    // console.log('unsetFullscreenVideo');
    if (!document.fullscreenElement) return;

    try {
        if (document.exitFullscreen) {
            await document.exitFullscreen();
        } else if (document.webkitExitFullscreen) {
            await document.webkitExitFullscreen();
        } else if (document.msExitFullscreen) {
            await document.msExitFullscreen();
        }
    } catch (e) {
        console.error('Error exiting fullscreen:', e);
    }

    data.isFullscreen = !!document.fullscreenElement;
}

/**
 * Toggles fullscreen mode
 */
async function toggleFullscreenVideo() {

    // console.log('toggleFullscreenVideo');
    if (document.fullscreenElement) {

        await unsetFullscreenVideo();
    } else {

        await setFullscreenVideo();
    }

    data.isFullscreen = !!document.fullscreenElement;
}


/**
 * Toggles video playback between play and pause states
 */
async function togglePauseVideo() {
    // console.log('togglePauseVideo');
    let video = document.querySelector('video');
    if (video.paused) {
        await video.play();
    }
    else {
        await video.pause();
    }

    data.playing = !video.paused;
    data.position = video.currentTime;
    data.duration = video.duration;
};

/**
 * Forces video to pause and updates playback state
 * @returns {boolean} Success status
 */
async function pauseVideo() {
    // console.log('pauseVideo');
    const video = document.querySelector('video');
    if (!video) return false;

    try {
        await video.pause();
        updateVideoState(video);
        return true;
    } catch (e) {
        console.error('Error pausing video:', e);
        return false;
    }
}

/**
 * Forces video to play and updates playback state
 * @returns {boolean} Success status
 */
async function resumeVideo() {
    // console.log('resumeVideo');
    const video = document.querySelector('video');
    if (!video) return false;

    try {
        await video.play();
        updateVideoState(video);
        return true;
    } catch (e) {
        console.error('Error resuming video:', e);
        return false;
    }
}

/**
 * Handles channel subscription toggle
 */
async function toggleSubscribeToChannel() {
    // console.log('toggleSubscribeToChannel');
    await fakeClick(document.querySelector('ytd-subscribe-button-renderer'));
    await fakeClick(document.querySelector('#confirm-button tp-yt-paper-button'));
    await fakeClick(document.querySelector('tp-yt-paper-button[dialog-confirm]'));
};

/**
 * Sets video position to a fraction of its duration
 * @param {number} n - Position fraction (0-10)
 */
function setVideoPosition(n) {
    // console.log('setVideoPosition');
    let video = document.querySelector('video');
    video.currentTime = Math.round(video.duration * (n / 10));
    video.play();
    updateVideoState(video);
};

/**
 * Jumps video position backward by 20 seconds
 */
async function backwardsInVideo() {
    // console.log('backwardsInVideo');
    let video = document.querySelector('video');
    video.currentTime = Math.min(video.duration, video.currentTime - 20);
    await video.play();
    updateVideoState(video);
};

/**
 * Jumps video position forward by 20 seconds
 */
async function forwardInVideo() {
    // console.log('forwardInVideo');
    let video = document.querySelector('video');
    video.currentTime = Math.min(video.duration, video.currentTime + 20);
    await video.play();
    updateVideoState(video);
};

/*
 * Video Discovery and Queue Management
 * Scans the current page for video links and maintains queues of pending
 * and completed videos while handling pagination
 */
function scanPageForLinks() {

    // console.log('scanPageForLinks');
    if (data.isSuggestionPage || data.isSearchPage || data.isSubscriptionsPage || data.isWatchLaterPage || data.isTrendingPage) {

        try {
            if (!pageScanned) {

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

                            c = YOUTUBE_BASE_URL + c.replace(YOUTUBE_BASE_URL, "");

                            if ((queueUrls.indexOf(c) < 0) && (doneUrls.indexOf(c) < 0) && (localDoneUrls.indexOf(c) < 0)) {

                                queueUrls.push(c);
                            }
                        }
                    }
                }

                data.more = queueUrls.length > 0;
                a = document.getElementsByTagName('span');
                while (queueUrls.length > 0 && i2++ < 5) {

                    let item = queueUrls.splice(0, 1)[0];
                    list.splice(0, 0, item);
                }

                for (let b of list) {

                    localDoneUrls.push(b);
                    data.open.push(b);
                }
            }

            if (queueUrls.length === 0) {

                window.scrollTo(0, document.querySelector('ytd-app').scrollHeight);
                setTimeout(function () {
                    pageScanned = false;
                    sessionStorage[STORAGE_KEYS.PAGESCANNED] = "false";
                    scanPageForLinks();
                }, 4000);
            }
            
        } finally {
            sessionStorage[STORAGE_KEYS.QUEUED] = JSON.stringify(queueUrls);
            localStorage[STORAGE_KEYS.DONE] = JSON.stringify(doneUrls);
            localStorage[STORAGE_KEYS.LOCALDONE] = JSON.stringify(localDoneUrls);
        }
    }
}

/*
 * Page Initialization Handler
 * Sets up video event listeners, visibility handlers, and initial state
 * Returns true when initialization is complete
 */
function initializePage() {

    // console.log('initializePage');
    if (first) {
        first = false;
        let vid = document.querySelector('video');
        if (vid) {

            if (!data.originalSource) data.originalSource = vid.currentSrc;
            vid.onended = () => { window.close() };
            vid.loop = false;
            vid.volume = 1;
            vid.muted = false;

            if (sessionStorage[STORAGE_KEYS.VIDEO_INITIALIZED] !== "true") {
                sessionStorage[STORAGE_KEYS.VIDEO_INITIALIZED] = "true";

                setupVisibilityHandler();

                vid.onprogress = (event) => {

                    let position = vid.currentTime;
                    let duration = vid.duration;
                    let left = duration - position;

                    if (left < 2) {

                        window.close();
                    }
                };
            }
        }
    }

    return true;
}

/*
 * State Management and Auto-close Logic
 * Updates page state, handles video positioning, and manages auto-close
 * functionality based on video progress
 */
function updatePage() {

    // console.log('updatePage');

    let vid = document.querySelector('video');

    if ((data.isViewPage || data.isShortsPage) && !vid) {

        vid = document.querySelector('video');
        if (!!vid) {

            sessionStorage[STORAGE_KEYS.INITIALIZED] !== "false"
            return;
        }
        else {
            return;
        }
    }


    scanPageForLinks();

    if (!(data.isViewPage || data.isShortsPage)) {

        data.description = document.title;
        data.title = data.isSearchPage ? 'Search page' :
            data.isSuggestionPage ? 'Recommended' :
                data.isSubscriptionsPage ? 'Subscriptions' :
                    data.isShortsPage ? 'Shorts' :
                        data.isWatchLaterPage ? 'Watch later' :
                            data.isTrendingPage ? "Trending" : 'Unknown page';
        data.subscribeTitle = '         ';
        data.playing = false;
        data.position = 0;
        data.duration = 0;
    } else {

        if (vid && (data.isViewPage || data.isShortsPage)) {

            if (vid.requestFullscreen) {
                vid.requestFullscreen();
            } else if (vid.mozRequestFullScreen) { /* Firefox */
                vid.mozRequestFullScreen();
            } else if (vid.webkitRequestFullscreen) { /* Chrome, Safari and Opera */
                vid.webkitRequestFullscreen();
            } else if (vid.msRequestFullscreen) { /* IE/Edge */
                vid.msRequestFullscreen();
            }

            updateVideoState(vid);

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

        try { data.description = document.querySelector('#description-inline-expander').innerText; } catch { data.description = ''; }
        try {
            if (data.description.indexOf("...more") >= 0) {

                document.querySelector('tp-yt-paper-button#expand').click();

                try { data.description = document.querySelector('#description-inline-expander').innerText; } catch { data.description = ''; }
            }
        } catch { }

        try { data.title = document.title; } catch { data.title = ''; }
        try { data.subscribeTitle = document.querySelectorAll('#subscribe-button span.yt-core-attributed-string.yt-core-attributed-string--white-space-no-wrap[role="text"]')[1].innerText.trim(); } catch { data.subscribeTitle = '           ' }
    }

    return true;
}

// Helper function to update video state
function updateVideoState(video) {

    // console.log('updateVideoState');
    if (!video) return;
    data.playing = !video.paused;
    data.position = video.currentTime;
    data.duration = video.duration;
    data.currentSource = video.currentSrc;

}

/*
 * Visibility Change Management
 * Implements intelligent pause/resume behavior when tab visibility changes
 * to provide better user experience across tab switches
 */
function setupVisibilityHandler() {

    // console.log('setupVisibilityHandler');
    const visibilityChange = ['', 'webkit', 'ms']
        .find(prefix => typeof document[prefix ? `${prefix}Hidden` : 'hidden'] !== 'undefined')
        ?.concat('visibilitychange') || 'visibilitychange';

    document.addEventListener(visibilityChange, async () => {
        const isHidden = document.hidden || document.msHidden || document.webkitHidden;
        const video = document.querySelector('video');
        // console.log('visibilityHandler');
        if (!isHidden) {
            pageScanned = false;
            sessionStorage[STORAGE_KEYS.PAGESCANNED] = "false";
            scanPageForLinks();
        }

        if (!video) return;

        if (isHidden && !video.paused) {
            await pauseVideo();
        } else if (!isHidden && video && video.paused) {
            first = false;
            initializePage();
            await resumeVideo();
        }
    }, false);
}

// Main execution

try {

    initializePage();
    updatePage();

    // Save state
    localStorage[STORAGE_KEYS.DONE] = JSON.stringify(doneUrls);
    sessionStorage[STORAGE_KEYS.QUEUED] = JSON.stringify(queueUrls);

    // Handle video state
    if (data.isViewPage || data.isShortsPage) {
        if (first) {
            (async function () {
                await new Promise(r => setTimeout(r, 1000));
                while (!(await pauseVideo())) {
                    await new Promise(r => setTimeout(r, 100));
                }
            })();
        } else if (second) {

            doneUrls.push(document.location.href);
            localStorage[STORAGE_KEYS.DONE] = JSON.stringify(doneUrls);

            resumeVideo();
        }
    }
} catch (e) {
    console.error('Script execution error:', e);
}
