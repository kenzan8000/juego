window.onload = function() {

    Vue.component('start-button', {
        props: [''],
        data: {
        },
        methods: {
            start: function() {
            }
        },
        template: `
            <div class="button-wrap">
                <button class="button" v-on:click="start();">START</button>
            </div>
        `
    });

    var startButton = new Vue({
        el: '#start-button',
        data: { },
        methods: {
        }
    });

//                for (var i = 3; i > 0; i--) { this.speak(i, 'es-MX'); }
//                //this.playBGM();
//            speak: function(text, lang) {
//                if (!window.speechSynthesis) { return; } // unsupported
//
//                var utterance = new SpeechSynthesisUtterance(text);
//                utterance.lang = lang;
//                utterance.volume = 1.0;         // 0.0 ~ 1.0
//                utterance.rate = 1.0;           // 0.0 ~ 10.0
//                utterance.pitch = 1.0;          // 0.0 ~ 2.0
//                window.speechSynthesis.speak(utterance);
//            },
//            playBGM: function() {
//                var bgm = new Howl({
//                    src: ['http://kolber.github.io/audiojs/demos/mp3/juicy.mp3'],
//                    loop: true
//                });
//                bgm.once('load', function() {
//                    bgm.play();
//                });
//            }

};
