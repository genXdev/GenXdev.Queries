let currentData = sessionStorage["data"] ? JSON.parse(sessionStorage["data"]) : ((this || window)["data"]) || { more: false, done: {}, urls: [], source: { url: document.location.href, page: 1 } };
//---------------
currentData.urls = [];

let a = document.getElementsByTagName('a');
for (let i = 0; i < a.length; i++) {

    try {
        let b = a[i].getAttribute('href');

        if (!!b && (typeof b === 'string') && b !== '' && b.substr(0, 1) !== '#' && b.indexOf('google') < 0) {

            if (b.indexOf('/search?') === 0) continue;
            if (currentData.done[b]) continue;

            currentData.done[b] = true;
            currentData.urls.push(b);
        }
    } catch (e) {

    }
}

//---------------

let fetchNext = function () {

    currentData.source.page++;

    setTimeout(() => {

        document.location.href = currentData.source.url + "&start=" + (currentData.source.page * 10);

    }, 100);
}

setInterval(fetchNext, 1100);

fetchNext();

//---------------

currentData.more = currentData.urls.length > 0;
sessionStorage["data"] = JSON.stringify(currentData);

data = currentData;
