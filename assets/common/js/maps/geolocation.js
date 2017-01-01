(function ($) {

    $.extend({

        geolocation: {

            watchIDs: [],

            get: function (o) {
                o = jQuery.geolocation.prepareOptions(o);
                $.geolocation.getCurrentPosition(o.success, o.error, o.options);
            },

            watch: function (o) {
                o = jQuery.geolocation.prepareOptions(o);
                return $.geolocation.watchPosition(o.success, o.error, o.options);
            },

            stop: function (watchID) {
                if (typeof navigator.geolocation != 'undefined') {
                    navigator.geolocation.clearWatch(watchID);
                }
            },

            getCurrentPosition: function (success, error, options) {
                if (typeof navigator.geolocation != 'undefined') {
                    navigator.geolocation.getCurrentPosition(success, error, options);
                } else {
                    error();
                }
            },

            watchPosition: function (success, error, options) {
                if (typeof navigator.geolocation != 'undefined') {
                    watchID = navigator.geolocation.watchPosition(success, error, options);
                    $.geolocation.watchIDs.push(watchID);
                    return watchID;
                } else {
                    error();
                }
            },

            clearWatch: function (watchID) {
                $.geolocation.stop(watchID);
            },

            getPosition: function (o) {
                o = jQuery.geolocation.prepareOptions(o);
                $.geolocation.getCurrentPosition(o.success, o.error, o.options);

            },

            prepareOptions: function (o) {

                if (!!o.error == false) {
                    o.error = function () {}
                }

                if (!!o.options == false) {
                    o.options = {
                        enableHighAccuracy: false,
                        maximumAge: 30000, // 30 seconds
                        timeout: 60000 // 1 minute
                    }
                }

                if (!!o.win != false) {
                    o.success = o.win;
                }

                if (!!o.fail != false) {
                    o.error = o.fail;
                }

                return o;

            },

            stopAll: function () {

                $.each(jQuery.geolocation.watchIDs, function (key, value) {
                    $.geolocation.stop(value);
                });

            }


        }

    });

})(jQuery);