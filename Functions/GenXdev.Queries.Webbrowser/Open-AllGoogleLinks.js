function fakeClick(anchorObj, event) {
    setTimeout(function () {
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
    }, 1000);
}

data.more = false;
data.done = !!data.done ? data.done : [];
data.urls = [];
window.queueUrls = !!window.queueUrls ? window.queueUrls : [];

let a = document.getElementsByTagName('a');

if (!window.onceOnly) {

    window.onceOnly = true;

    let i2 = 0;
    for (let i = 0; i < a.length; i++) {

        try {
            let b = a[i].getAttribute('href');

            if (!!b && (typeof b === 'string') && b !== '' && b.substr(0, 1) !== '#' && b.indexOf('google') < 0 && data.done.indexOf(b) < 0) {

                if (b.indexOf('/search?') === 0) {

                    continue;
                }

                if (i2++ < 10) {
                    window.open(b);
                } else {
                    window.queueUrls.push(b);
                }

                window.scrollTo(0, document.body.scrollHeight);
            }
        } catch (e) {

        }
    }
}

a = document.getElementsByTagName('span');
for (let i = 0; i < a.length; i++) {

    if (a[i].innerText === "Next" || a[i].innerText === "Volgende") {

        data.more = true;
        break;
    }
}