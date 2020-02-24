<#include '../base.ftl'>

<#macro stylesheets>
    <link href="/resources/style/style.css" rel="stylesheet" media="screen">
</#macro>

<#macro error_text>
    Ошибка 🤷‍♂️
</#macro>

<#macro body>
    <div class="container">
        <div class="center-content">

            <div id="content">
                <div class="title center error_text"><@error_text/></div>
            </div>

            <div style="height: 220px; position: relative; z-index: -1; opacity: 100">
                <img class="center" style="width: 290px;" src="/resources/images/Logo/Logo v11.png"/>
            </div>

        </div>

    </div>
</#macro>
