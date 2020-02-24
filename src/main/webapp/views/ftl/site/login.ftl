<#include '../base.ftl'>

<#macro title>Вход в админку</#macro>

<#macro stylesheets>
    <link href="/resources/style/style.css" rel="stylesheet" media="screen">
    <link href="/resources/style/signin.css" rel="stylesheet" media="screen">
</#macro>

<#macro javascripts>
    <script src="/resources/js/jquery.min.js"></script>
</#macro>

<#macro body>
    <div class="container">
        <form class="form-center-content" action="/admin/login/process" method="post">
            <div class="form-signin-heading">Вход</div>
            <div class="title center">Lelei Shop</div>
            <div class="text center">Инструмент для управления сайтом</div>

            <#if error??>
                <div class="error_text">
                    Не верный логин или пароль
                </div>
            </#if>

            <label for="inputName" class="sr-only">Имя</label>
            <input name="username" value="" type="text" id="inputName" class="form-control" placeholder="Имя"
                   required="" autofocus="">
            <label for="inputPassword" class="sr-only">Пароль</label>
            <input name="password" value="" type="password" id="inputPassword" class="form-control" placeholder="Пароль"
                   required="">
            <input type="hidden" name="${_csrf.parameterName}"
                   value="${_csrf.token}"/>
            <button name="submit" class="login-button" type="submit">Войти</button>
            <a class="register-button" href="/">Сайт</a>
        </form>

    </div>
</#macro>

<@display_page/>