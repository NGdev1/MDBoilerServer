<#macro title>Welcome!</#macro>
<#macro stylesheets></#macro>
<#macro body></#macro>
<#macro javascripts></#macro>

<#macro display_page>
<!DOCTYPE html>
<html>
<head>
    <title><@title/></title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width; initial-scale=1">
    <@stylesheets/>
</head>

<body>
    <@body/>
    <@javascripts/>
</body>
</html>
</#macro>