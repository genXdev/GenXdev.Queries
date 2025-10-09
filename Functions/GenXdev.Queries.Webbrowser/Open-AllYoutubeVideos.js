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
let queueUrls = [], doneUrls = [], localDoneUrls = [];
try {
    queueUrls = JSON.parse(sessionStorage[STORAGE_KEYS.QUEUED] || '[]');
    doneUrls = JSON.parse(localStorage[STORAGE_KEYS.DONE] || '[]');
    localDoneUrls = JSON.parse(localStorage[STORAGE_KEYS.LOCALDONE] || '[]');
} catch (e) {
    console.error('Storage parsing error:', e.message, e.stack);
    queueUrls = [];
    doneUrls = [];
    localDoneUrls = [];
}

// Helper function to wait for DOM elements
async function waitForElements(selector, timeout = 10000) {
    const startTime = Date.now();
    while (Date.now() - startTime < timeout) {
        const elements = document.querySelectorAll(selector);
        if (elements.length > 0) {
            console.log(`Found ${elements.length} elements for selector: ${selector}`);
            return elements;
        }
        await new Promise(resolve => setTimeout(resolve, 500));
    }
    console.warn(`Timeout waiting for elements: ${selector}`);
    return [];
}

/*
 * Simulates natural user interaction by triggering a sequence of DOM events
 * Uses minimal events with randomized delays for better compatibility
 */
async function fakeClick(anchorObj, event) {
    if (!anchorObj) {
        console.warn('fakeClick: No anchor object provided');
        return;
    }
    try {
        const events = [
            { type: 'mousedown', init: { bubbles: true, cancelable: true } },
            { type: 'mouseup', init: { bubbles: true, cancelable: true } },
            { type: 'click', init: { bubbles: true, cancelable: true } }
        ];
        for (const evt of events) {
            const mouseEvent = new MouseEvent(evt.type, evt.init);
            anchorObj.dispatchEvent(mouseEvent);
            await new Promise(resolve => setTimeout(resolve, Math.random() * 200 + 250));
        }
    } catch (e) {
        console.error('fakeClick error:', e.message, e.stack);
    }
}

/*
 * Video Fullscreen Management Functions
 */
async function setFullscreenVideo() {
    const video = document.querySelector('video');
    if (!video || document.fullscreenElement) {
        console.warn('setFullscreenVideo: No video or already in fullscreen');
        return;
    }
    try {
        if (video.requestFullscreen) {
            await video.requestFullscreen();
        } else if (video.webkitRequestFullscreen) {
            await video.webkitRequestFullscreen();
        } else if (video.msRequestFullscreen) {
            await video.msRequestFullscreen();
        }
        data.isFullscreen = !!document.fullscreenElement;
        if (data.isFullscreen) {
            video.style.cssText = 'object-fit: contain; background-color: black;';
        }
        console.log('Entered fullscreen mode');
    } catch (e) {
        console.error('Error entering fullscreen:', e.message, e.stack);
    }
}

async function unsetFullscreenVideo() {
    if (!document.fullscreenElement) {
        console.log('unsetFullscreenVideo: Not in fullscreen');
        return;
    }
    try {
        if (document.exitFullscreen) {
            await document.exitFullscreen();
        } else if (document.webkitExitFullscreen) {
            await document.webkitExitFullscreen();
        } else if (document.msExitFullscreen) {
            await document.msExitFullscreen();
        }
        data.isFullscreen = !!document.fullscreenElement;
        console.log('Exited fullscreen mode');
    } catch (e) {
        console.error('Error exiting fullscreen:', e.message, e.stack);
    }
}

async function toggleFullscreenVideo() {
    if (data.isShortsPage) { return }
    console.log('Toggling fullscreen');
    if (document.fullscreenElement) {
        await unsetFullscreenVideo();
    } else {
        await setFullscreenVideo();
    }
}

/*
 * Video Playback Control
 */
async function togglePauseVideo() {
    const video = document.querySelector('video');
    if (!video) {
        console.warn('togglePauseVideo: No video element found');
        return;
    }
    try {
        if (video.paused) {
            await video.play();
        } else {
            await video.pause();
        }
        updateVideoState(video);
        console.log(`Video ${video.paused ? 'paused' : 'playing'}`);
    } catch (e) {
        console.error('Error toggling video pause:', e.message, e.stack);
    }
}

async function pauseVideo() {
    const video = document.querySelector('video');
    if (!video) {
        console.warn('pauseVideo: No video element found');
        return false;
    }
    try {
        await video.pause();
        updateVideoState(video);
        console.log('Video paused');
        return true;
    } catch (e) {
        console.error('Error pausing video:', e.message, e.stack);
        return false;
    }
}

async function resumeVideo() {
    const video = document.querySelector('video');
    if (!video) {
        console.warn('resumeVideo: No video element found');
        return false;
    }
    try {
        await video.play();
        updateVideoState(video);
        console.log('Video resumed');
        return true;
    } catch (e) {
        console.error('Error resuming video:', e.message, e.stack);
        return false;
    }
}

/*
 * Channel Subscription
 */
async function toggleSubscribeToChannel() {
    try {
        const selectors = [
            'ytd-subscribe-button-renderer',
            'tp-yt-paper-button#subscribe-button',
            'ytd-button-renderer#subscribe-button'
        ];
        for (const selector of selectors) {
            const button = document.querySelector(selector);
            if (button) {
                await fakeClick(button);
                console.log(`Clicked subscribe button: ${selector}`);
                break;
            }
        }
        const confirmButton = document.querySelector('#confirm-button tp-yt-paper-button') ||
            document.querySelector('tp-yt-paper-button[dialog-confirm]');
        if (confirmButton) {
            await fakeClick(confirmButton);
            console.log('Clicked confirmation button');
        }
    } catch (e) {
        console.error('Error toggling subscription:', e.message, e.stack);
    }
}

/*
 * Video Position Control
 */
function setVideoPosition(n) {
    const video = document.querySelector('video');
    if (!video) {
        console.warn('setVideoPosition: No video element found');
        return;
    }
    try {
        video.currentTime = Math.round(video.duration * (n / 10));
        video.play();
        updateVideoState(video);
        console.log(`Set video position to ${video.currentTime}s`);
    } catch (e) {
        console.error('Error setting video position:', e.message, e.stack);
    }
}

async function backwardsInVideo() {
    const video = document.querySelector('video');
    if (!video) {
        console.warn('backwardsInVideo: No video element found');
        return;
    }
    try {
        video.currentTime = Math.max(0, video.currentTime - 20);
        await video.play();
        updateVideoState(video);
        console.log(`Moved video back to ${video.currentTime}s`);
    } catch (e) {
        console.error('Error moving video backward:', e.message, e.stack);
    }
}

async function forwardInVideo() {
    const video = document.querySelector('video');
    if (!video) {
        console.warn('forwardInVideo: No video element found');
        return;
    }
    try {
        video.currentTime = Math.min(video.duration, video.currentTime + 20);
        await video.play();
        updateVideoState(video);
        console.log(`Moved video forward to ${video.currentTime}s`);
    } catch (e) {
        console.error('Error moving video forward:', e.message, e.stack);
    }
}

/*
 * Video Discovery and Queue Management
 */
async function scanPageForLinks() {
    // debugger;
    if (!(data.isSuggestionPage || data.isSearchPage || data.isSubscriptionsPage || data.isWatchLaterPage || data.isTrendingPage)) {
        console.log('Not scanning: Not a supported page type');
        return;
    }
    if (pageScanned) {
        console.log('Skipping scan: Page already scanned');
        return;
    }
    try {
        const selectors = [
            'a'
        ];
        let videoLinks = [];
        for (const selector of selectors) {
            const elements = await waitForElements(selector);
            const links = Array.from(elements)
                .map(el => el.getAttribute('href'))
                .filter(href => href && (href.includes('/watch?v') || href.includes('/shorts/')))
                .map(href => href.startsWith(YOUTUBE_BASE_URL) ? href : YOUTUBE_BASE_URL + href);
            videoLinks = [...new Set([...videoLinks, ...links])]; // Remove duplicates
            if (videoLinks.length > 0) {
                console.log(`Found ${videoLinks.length} links with selector: ${selector}`);
                break;
            }
        }
        if (videoLinks.length === 0) {
            console.warn('No video links found');
        }
        const newLinks = videoLinks.filter(url => !queueUrls.includes(url) && !doneUrls.includes(url) && !localDoneUrls.includes(url));
        queueUrls.push(...newLinks);
        data.more = queueUrls.length > 0;
        const list = queueUrls.splice(0, Math.min(5, queueUrls.length));
        for (const url of list) {
            localDoneUrls.push(url);
            data.open.push(url);
        }
        if (queueUrls.length === 0 && (data.isSuggestionPage || data.isSearchPage || data.isSubscriptionsPage)) {
            window.scrollTo(0, document.querySelector('ytd-app')?.scrollHeight || document.body.scrollHeight);
            await new Promise(resolve => setTimeout(resolve, 4000));
            pageScanned = false;
            sessionStorage[STORAGE_KEYS.PAGESCANNED] = "false";
            console.log('Scrolled to bottom, re-scanning for links');
            await scanPageForLinks();
        }
        sessionStorage[STORAGE_KEYS.QUEUED] = JSON.stringify(queueUrls);
        localStorage[STORAGE_KEYS.LOCALDONE] = JSON.stringify(localDoneUrls);
        console.log(`Queue updated: ${queueUrls.length} videos remaining`);
    } catch (e) {
        console.error('Error scanning page for links:', e.message, e.stack);
    }
}

/*
 * Page Initialization Handler
 */
function initializePage() {
    if (!first) {
        console.log('Skipping initialization: Already initialized');
        return true;
    }
    first = false;
    sessionStorage[STORAGE_KEYS.INITIALIZED] = "true";
    try {
        const video = document.querySelector('video');
        if (video) {
            if (!data.originalSource) data.originalSource = video.currentSrc;
            video.onended = () => {
                console.log('Video ended, closing window');
                window.close();
            };
            video.loop = false;
            video.volume = 1;
            video.muted = false;
            if (sessionStorage[STORAGE_KEYS.VIDEO_INITIALIZED] !== "true") {
                sessionStorage[STORAGE_KEYS.VIDEO_INITIALIZED] = "true";
                setupVisibilityHandler();
                video.onprogress = () => {
                    const position = video.currentTime;
                    const duration = video.duration;
                    const left = duration - position;
                    if (left < 2 && !isNaN(left)) {
                        console.log('Video nearly ended, closing window');
                        window.close();
                    }
                };
            }
            console.log('Video initialized');
        } else {
            console.warn('No video element found during initialization');
        }
        return true;
    } catch (e) {
        console.error('Error initializing page:', e.message, e.stack);
        return false;
    }
}

/*
 * State Management and Auto-close Logic
 */
async function updatePage() {
    try {
        const video = document.querySelector('video');
        if ((data.isViewPage || data.isShortsPage) && !video) {
            console.warn('No video element found on video page');
            return false;
        }
        await scanPageForLinks();
        if (!(data.isViewPage || data.isShortsPage)) {
            data.description = document.title || '';
            data.title = data.isSearchPage ? 'Search page' :
                data.isSuggestionPage ? 'Recommended' :
                    data.isSubscriptionsPage ? 'Subscriptions' :
                        data.isShortsPage ? 'Shorts' :
                            data.isWatchLaterPage ? 'Watch later' :
                                data.isTrendingPage ? 'Trending' : 'Unknown page';
            data.subscribeTitle = '';
            data.playing = false;
            data.position = 0;
            data.duration = 0;
            console.log(`Updated state for ${data.title} page`);
        } else if (video) {
            if (!data.isShortsPage) {

                try {
                    if (video.requestFullscreen && !data.isFullscreen) {
                        await video.requestFullscreen();
                    } else if (video.mozRequestFullScreen) {
                        await video.mozRequestFullScreen();
                    } else if (video.webkitRequestFullscreen) {
                        await video.webkitRequestFullscreen();
                    } else if (video.msRequestFullscreen) {
                        await video.msRequestFullscreen();
                    }
                } catch (e) {
                    console.error('Error requesting fullscreen:', e.message, e.stack);
                }
            }
            updateVideoState(video);
            if (isNaN(data.duration)) {
                if (!data.timer) {
                    data.timer = setTimeout(() => {
                        console.log('Duration NaN, closing window');
                        window.close();
                    }, 60000);
                }
            } else if (data.playing && data.duration - data.position < 3 && data.originalSource === data.currentSource) {
                if (!data.timer) {
                    data.timer = setTimeout(() => {
                        console.log('Video nearly ended, closing window');
                        window.close();
                    }, 3500);
                }
            } else if (data.timer) {
                clearTimeout(data.timer);
                data.timer = null;
            }
            try {
                const description = document.querySelector('#description-inline-expander')?.innerText || '';
                if (description.includes('...more')) {
                    const expandButton = document.querySelector('tp-yt-paper-button#expand');
                    if (expandButton) {
                        expandButton.click();
                        await new Promise(resolve => setTimeout(resolve, 500));
                        data.description = document.querySelector('#description-inline-expander')?.innerText || '';
                    }
                } else {
                    data.description = description;
                }
            } catch (e) {
                console.error('Error retrieving description:', e.message, e.stack);
                data.description = '';
            }
            data.title = document.title || '';
            try {
                const subscribeButtons = document.querySelectorAll('#subscribe-button span.yt-core-attributed-string.yt-core-attributed-string--white-space-no-wrap[role="text"]');
                data.subscribeTitle = subscribeButtons[1]?.innerText.trim() || '';
            } catch (e) {
                console.error('Error retrieving subscribe title:', e.message, e.stack);
                data.subscribeTitle = '';
            }
            console.log(`Updated state for video page: ${data.title}`);
        }
        return true;
    } catch (e) {
        console.error('Error updating page:', e.message, e.stack);
        return false;
    }
}

/*
 * Helper function to update video state
 */
function updateVideoState(video) {
    if (!video) {
        console.warn('updateVideoState: No video element provided');
        return;
    }
    try {
        data.playing = !video.paused && !video.ended;
        data.ended = video.ended
        data.position = video.currentTime;
        data.duration = video.duration;
        data.currentSource = video.currentSrc;
        video.loop = false
    } catch (e) {
        console.error('Error updating video state:', e.message, e.stack);
    }
}

/*
 * Visibility Change Management
 */
function setupVisibilityHandler() {
    const visibilityChange = ['', 'webkit', 'ms']
        .find(prefix => typeof document[prefix ? `${prefix}Hidden` : 'hidden'] !== 'undefined')
        ?.concat('visibilitychange') || 'visibilitychange';
    document.addEventListener(visibilityChange, async () => {
        const isHidden = document.hidden || document.msHidden || document.webkitHidden;
        const video = document.querySelector('video');
        console.log(`Visibility changed: hidden=${isHidden}`);
        if (!isHidden) {
            pageScanned = false;
            sessionStorage[STORAGE_KEYS.PAGESCANNED] = "false";
            await scanPageForLinks();
        }
        if (!video) {
            console.warn('No video element found for visibility handler');
            return;
        }
        if (isHidden && !video.paused) {
            await pauseVideo();
        } else if (!isHidden && video.paused) {
            first = false;
            initializePage();
            await resumeVideo();
        }
    }, false);
    console.log('Visibility handler set up');
}

// Main execution
(async function main() {
    try {
        console.log('Starting YouTube Video Manager Script');
        initializePage();
        await updatePage();
        localStorage[STORAGE_KEYS.DONE] = JSON.stringify(doneUrls);
        sessionStorage[STORAGE_KEYS.QUEUED] = JSON.stringify(queueUrls);
        if (data.isViewPage || data.isShortsPage) {
            if (first) {
                await new Promise(resolve => setTimeout(resolve, 1000));
                while (!(await pauseVideo())) {
                    await new Promise(resolve => setTimeout(resolve, 100));
                }
            } else if (second) {
                doneUrls.push(document.location.href);
                localStorage[STORAGE_KEYS.DONE] = JSON.stringify(doneUrls);
                await resumeVideo();
            }
        }
        console.log('Script execution completed');
    } catch (e) {
        console.error('Script execution error:', e.message, e.stack);
    }
})();