(function() {
    
    window.modal = function (options)
    {

        options = $.extend({}, {
            height: 250,
            width: 300,
            title: null,
            showCloseButton: true,
            icon: null,
            display: 'block',
            style: {},
            onclose: null,  // click event
            onsubmit: null  // form submit event
        }, options);

        this.remove = function()
        {
            if("function" === typeof options.onclose)
                options.onclose.call(this);

            this.window.remove();
            this.overlay.remove();
        };

        this.setTitle = function(text)
        {
            this.title.css({display: 'block'}).text(text);

            return this;
        };

        this.setIcon = function(url)
        {
            this.title.css({
                backgroundImage: 'url(' + url + ')',
                paddingLeft: '30px'
            });
        };

        this.setHeight = function(height)
        {
            if(this.title && this.title.css('display') === 'block')
                height += this.title.outerHeight();

            this.window.css({
                height:     height,
                marginTop:  -1*Math.ceil(height/2)
            });

            return this;
        };

        this.setWidth = function(width)
        {
            this.window.css({
                width:      width,
                marginLeft: -1*Math.ceil(width/2)
            });

            return this;
        };

        this.showCloseButton = function(show)
        {
            show ? this.closeButton.show() : this.closeButton.hide();
            return this;
        };

        this.show = function()
        {
            this.overlay.show();
            this.window.show();
        };

        this.hide = function()
        {
            this.overlay.hide();
            this.window.hide();
        };

        this.setBody = function(html)
        {
            this.body.html(html);

            // find all submits and subscribe to click event
            if("function" === typeof options.onsubmit)
            {
                $('FORM', this.body).each(function(i, form)
                {
                    var $form = $(form);
                    
                    if($form.formHandler('isInitialized'))
                    {
                        $form.formHandler('submit', options.onsubmit);
                    }
                    else
                    {
                        $('input[type=submit]', $form).click($.proxy(options.onsubmit, this));
                    }
                });
            }

            return this;
        };

        this.appendBody = function(html)
        {
            this.body.append(html);

            return this;
        };

        this.setBodyStyle = function(style)
        {
            this.body.css(style);

            return this;
        };

        var modal = this;
        var $body = $('body');

        this.overlay = $('<div class="modal-overlay"></div>').css({
            height: $(document).height(),
            display: options.display
        }).appendTo($body);

        this.window = $('<div class="modal-window"></div>').css({
            top: $(document).scrollTop() + $(window).height()/2,
            display: options.display
        }).appendTo($body);

        this.setHeight(options.height).setWidth(options.width);


        this.closeButton = $('<a class="close" href="javascript:void(0);"></a>')
            .click(function(){modal.remove();}).appendTo(this.window);
        this.showCloseButton(options.showCloseButton);

        this.title = $('<div class="modal-title"></div>').prependTo(this.window);
        if(options.title !== null)
            this.setTitle(options.title);
        if(options.icon !== null)
            this.setIcon(options.icon);

        // create body
        var titleHeight = (this.title.css('display') == 'none')
            ? 0 
            : (this.title.height() + this.title.outerHeight(true));

        this.body = $('<div class="body"></div>');
        this.body.height(this.window.height() - titleHeight)
            .appendTo(this.window);

        // set style
        if(options.style)
            this.setBodyStyle(options.style);

        return this;
    };

    window.modal.open = function(a, options)
    {
        var m = new modal($.extend({}, 
            { title: a.getAttribute('title') }, 
            options)
        );

        $.post(a.getAttribute('href'), function(response) {
            m.setBody(response);
        });
    };

    $.fn.modal = function(options)
    {
        var m;

        if(this.data('modal-instance'))
        {
            m = this.data('modal-instance');
        }
        else
        {
            m = new modal(options);
            m.body.append(this.show().css({marginTop: '20px'}));

            this.data('modal-instance', m);
        }

        if(typeof options == 'string')
        {
            switch(options)
            {
                case 'show': m.show(); break;
                case 'hide': m.hide(); break;
            }
        }

        return this;
    };
})();