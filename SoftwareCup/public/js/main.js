


    var resizing = false,
        navigationWrapper = $('.cd-main-nav-wrapper'),
        navigation = navigationWrapper.children('.cd-main-nav'),
        searchForm = $('.cd-main-search'),
        searchSuggest=$('.cd-search-suggestions'),
        pageContent = $('.cd-main-content'),
        searchTrigger = $('.cd-search-trigger'),
        coverLayer = $('.cd-cover-layer'),
        navigationTrigger = $('.cd-nav-trigger'),
        mainHeader = $('.cd-main-header'),
        mainContent=$('.cd-main-content');

    function subfunc() {
        searchSuggest.show();
        var val = $(".cd-textedit").val();
        var selOp = $("#select-category").val();
        $.ajax({
            type: "post",
            url: "/",
            data: {val: val, opt: selOp},
            dataType: "json",
            success: function (data) {
                var htm = "";
                $("#AssociativeSearch").html("");

                data=data.data;

                if(data.length==0)
                    $("#AssociativeSearch").html("暂无结果");
                //alert(JSON.stringify(data));
                for (var i=0;i<data.length;i++){
                    var data1 = data[i].CORP_NAME;
                    var html='';
                    html += '<li'+' id="'+data[i].ID +'">';
                    html += '<a class="image-wrapper" href="#0"><img src="img/placeholder.png" alt="News image"></a>';
                    html += '<h4><a class="cd-nowrap" href="#0">'+data[i].CORP_NAME + '</a></h4>';
                    html += '<time datetime="2016-01-12">'+ data[i].CHECK_DATE + '</time>';
                    html +='</li>';
                    $("#AssociativeSearch").append(html);
                }
                //alert(htm);
                //closeSearchForm();

                $("#AssociativeSearch").children("li").click(function () {

                    for(var i=0;i<data.length;i++){
                        console.log("data[i].ID :" + data[i].ID);
                        console.log("$(this).attr('id') :" + $(this).attr('id'));
                        if(data[i].ID == $(this).attr('id')){
                            WriteCorpDetailMsg(data[i]);
                            closeSearchForm();
                            break;
                        }

                    }
                })
            }
        });
    }

    function WriteCorpDetailMsg(data) {


        $("#CORP_NAME").html(data.CORP_NAME);
        //电话
        $("#TEL").html(data.TEL);
        //官网
        $("#WEB_URL").html(data.WEB_URL);
        //邮箱
        $("#EMAIL").html(data.EMAIL);
        //地址
        $("#ADDR").html(data.ADDR);

        //附近公司
        // $("#NearCom").html(data.);

        //登记机关
        $("#BELONG_ORG").html(data.BELONG_ORG);
        //所属地区
        $("#BELONG_DIST_ORG").html(data.BELONG_DIST_ORG);
        //所属行业
        $("#BELONG_TRADE").html(data.BELONG_TRADE);
        //公司类型
        $("#ECON_KIND").html(data.ECON_KIND);
        //企业大类
        $("#ADMIT_MAIN").html(data.ADMIT_MAIN);
        //成立日期
        $("#START_DATE").html(data.START_DATE);
        //核准日期
        $("#CHECK_DATE").html(data.CHECK_DATE);
        //法人证件
        $("#OPER_MAN_IDENT_NO").html(data.OPER_MAN_IDENT_NO);
        //法人姓名
        $("#OPER_MAN_NAME").html(data.OPER_MAN_NAME);
        //经营状态
        $("#CORP_STATUS").html(data.CORP_STATUS);
        //注册资金
        $("#REG_CAPI").html(data.REG_CAPI);
        //经营期限
        $("#FARE_TERM_START").html(data.FARE_TERM_START);
        //注册号
        $("#UNI_SCID").html(data.UNI_SCID);
        //从业人数
        $("#PRAC_PERSON_NUM").html(data.PRAC_PERSON_NUM);
        //组织机构
        $("#ORG_INST_CODE").html(data.ORG_INST_CODE);
        //纳税人
        $("#TAXPAY_NUM").html(data.TAXPAY_NUM);
        //人员规模
        $("#STAFF_SIZE").html(data.STAFF_SIZE);
        //创建机构
        $("#CREATE_ORG").html(data.CREATE_ORG);
        //曾用名
        $("#FORMER_NAME").html(data.FORMER_NAME);
        //英文名
        $("#ENGLISH_NAME").html(data.ENGLISH_NAME);
        //经营范围
        $("#FARE_SCOPE").html(data.FARE_SCOPE);


    }






    function checkWindowWidth() {
        var mq = window.getComputedStyle(mainHeader.get(0), '::before').getPropertyValue('content').replace(/"/g, '').replace(/'/g, "");
        return mq;
    }

    function checkResize() {
        if( !resizing ) {
            resizing = true;
            (!window.requestAnimationFrame) ? setTimeout(moveNavigation, 300) : window.requestAnimationFrame(moveNavigation);
        }
    }

    function moveNavigation(){
        var screenSize = checkWindowWidth();
        if ( screenSize == 'desktop' && (navigationTrigger.siblings('.cd-main-search').length == 0) ) {
            //desktop screen - insert navigation and search form inside <header>
            searchForm.detach().insertBefore(navigationTrigger);
            navigationWrapper.detach().insertBefore(searchForm).find('.cd-serch-wrapper').remove();
            //searchSuggest.removeClass('cd-search-suggestions');
        } else if( screenSize == 'mobile' && !(mainHeader.children('.cd-main-nav-wrapper').length == 0)) {
            //mobile screen - move navigation and search form after .cd-main-content element
            navigationWrapper.detach().insertAfter('.cd-main-content');
            var newListItem = $('<li class="cd-serch-wrapper"></li>');
            searchForm.detach().appendTo(newListItem);
            newListItem.appendTo(navigation);

        }

        resizing = false;
    }

    function closeSearchForm() {
        searchTrigger.removeClass('search-form-visible');
        searchForm.removeClass('is-visible');
        coverLayer.removeClass('search-form-visible');
    }

    //add the .no-pointerevents class to the <html> if browser doesn't support pointer-events property
    ( !Modernizr.testProp('pointerEvents') ) && $('html').addClass('no-pointerevents');

    //move navigation and search form elements according to window width
    moveNavigation();
    $(window).on('resize', checkResize);

    //mobile version - open/close navigation
    navigationTrigger.on('click', function(event){
        event.preventDefault();
        mainHeader.add(navigation).add(pageContent).toggleClass('nav-is-visible');
    });

    searchTrigger.on('click', function(event){
        event.preventDefault();
        if( searchTrigger.hasClass('search-form-visible') ) {
            searchForm.find('form').submit();
        } else {
            searchTrigger.addClass('search-form-visible');
            searchForm.addClass('is-visible').one('webkitTransitionEnd otransitionend oTransitionEnd msTransitionEnd transitionend', function(){
                searchForm.find('input[type="search"]').focus().end().off('webkitTransitionEnd otransitionend oTransitionEnd msTransitionEnd transitionend');
            });
            searchSuggest.hide();
        }
    });

    searchForm.submit(subfunc);
    //close search form
    searchForm.on('click', '.close', function(){
        closeSearchForm();
    });

    coverLayer.on('click', function(){
        closeSearchForm();
    });

    $(document).keyup(function(event){
        if( event.which=='27' ) closeSearchForm();
        if( event.which=='13' ) searchForm.find('form').submit();
    });

    //upadate span.selected-value text when user selects a new option
    searchForm.on('change', 'select', function(){
        searchForm.find('.selected-value').text($(this).children('option:selected').text());
    });
    // noinspection JSAnnotator

