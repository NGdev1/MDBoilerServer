<#-- @ftlvariable name="content" type="String" -->

<#include '../base.ftl'>

<#macro title>Котел</#macro>

<#macro stylesheets>
    <link href="/resources/style/normalize.css" rel="stylesheet" media="screen">
    <link href="/resources/style/style.css" rel="stylesheet" media="screen">
    <link href="/resources/style/site/style.css" rel="stylesheet" media="screen">
    <link href="/resources/style/colors.css" rel="stylesheet" media="screen">
    <link href="/resources/style/glyphicon.css" rel="stylesheet" media="screen">
    <link href="/resources/style/loading.css" rel="stylesheet" media="screen">

    <link href="/resources/style/jquery/jquery-ui.min.css" rel="stylesheet" media="screen">
    <link href="/resources/style/jquery/jquery-ui.structure.min.css" rel="stylesheet" media="screen">
    <link href="/resources/style/jquery/jquery-ui.theme.min.css" rel="stylesheet" media="screen">
</#macro>

<#macro javascripts>
    <script type="text/javascript">

        let contentContainer;
        let loadingIndicator;

        $(document).ready(function () {
            contentContainer = $('#content');
            loadingIndicator = $('#circleG');

            loadingIndicator.hide();
        });

        function loadContent(url, title, addToHistory) {
            if (url !== undefined && contentContainer !== undefined) {

                loadingIndicator.show();
                contentContainer.hide();

                $.ajax({
                    url: url,
                    type: "GET"
                }).done(function (data) {
                    document.title = title;

                    loadingIndicator.hide();

                    $(document).scrollTop(0);

                    contentContainer.fadeTo(200, 1);
                    contentContainer.html(data);

                    if (addToHistory) {
                        window.history.pushState({"html": data, "pageTitle": title}, title, url);
                    }
                });
            }
        }

        function showDialog(title, message) {
            const dialogMessage = $("<div/>");
            const messageContainer = $('<p/>', {
                html: message
            });
            dialogMessage.append(messageContainer);

            dialogMessage.dialog({
                title: title,
                modal: true,
                buttons: {
                    Закрыть() {
                        $(this).dialog("close");
                    }
                }
            });
        }

    </script>
</#macro>

<#macro body>

    <script src="/resources/js/jquery.min.js"></script>
    <script src="/resources/js/jquery-ui.min.js"></script>

    <div class="center-content">

        <header>
            <div class="main-header-info">
                <div class="logo"></div>
                <div class="title">Управление котлом</div>
                <div class="contact-info"><span class="glyphicon glyphicon-phone-alt"></span> +7(952)034-04-16</div>
            </div>
        </header>

        <div class="clear"></div>

        <#include 'ui-components/loading-indicator.ftl'>

        <div id="content">

            <#if content=='main'>

                <#include 'main.ftl'>

            <#elseif content=='set-state'>

                <#include 'set-state.ftl'>

            </#if>

        </div>

    </div>
    <!-- /container -->

</#macro>

<@display_page/>