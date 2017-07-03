window.onload = function() {

    Vue.component('start-button', {
        props: [''],
        methods: {
            playBGM: function() {
                var bgm = new Howl({
                    src: ['http://kolber.github.io/audiojs/demos/mp3/juicy.mp3'],
                    loop: true
                });
                bgm.once('load', function() {
                    bgm.play();
                });
            }
        },
        template: `
            <div class="button-wrap">
                <button class="button" v-on:click="playBGM();">START</button>
            </div>
        `
    });
    new Vue({
        el: '#start-button',
        data: { },
        methods: {
        }
    });

};
