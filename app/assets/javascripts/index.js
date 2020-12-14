// import { JSFrame } from 'jsframe.js';

window.onload = function() {
    elms = document.querySelectorAll("div.delete-account");
    elms.forEach(element => {
        element.addEventListener("click", (e) => {
            showmodal();
        })
    });
};

function showmodal() {

    const jsFrame = new JSFrame();
    const frame = jsFrame.create({
        title: '',
        left: 500, top: 500, width: 200, height: 100,
        movable: false,
        resizable: false,
        html:`
            <div id="my_element" style="padding:10px;font-size:12px;color:darkgray;display:flex;">
                <button onClick="cancel()">キャンセル</button>
                <button onClick="">削除する</button>
            </div>
        `
    });

    frame.showModal(_frame => {

    });

    // frame.setPosition(500, 100);
    // frame.show();
}

function cancel() {
    close();
}