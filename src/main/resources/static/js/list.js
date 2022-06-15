const vm = new Vue({
    el: '#root',
    data: {
        friendsShown: true,
        requestsShown: false,
        friends: [
            { name: 'Ronald Castellon', avatar: 'https://www.fakepersongenerator.com/Face/male/male20161083938332337.jpg' },
            { name: 'Lee Smith', avatar: 'https://www.fakepersongenerator.com/Face/male/male20151083712944519.jpg' },
            { name: 'Tina McMullen', avatar: 'https://www.fakepersongenerator.com/Face/female/female1022946652252.jpg' }
        ],
        requests: [
            { name: 'Eddie Shifflett', avatar: 'https://www.fakepersongenerator.com/Face/female/female20161024815101136.jpg' },
            { name: 'Winifred Imes', avatar: 'https://www.fakepersongenerator.com/Face/male/male108460114313.jpg' }
        ]
    },
    computed: {
        people: function () {
            if (this.friendsShown) {
                return this.friends
            } else {
                return this.requests
            }
        }
    },
    methods: {
        setFirst: function () {
            this.friendsShown = true
            this.requestsShown = false
        },
        setSecond: function () {
            this.friendsShown = false
            this.requestsShown = true
        }
    }
})