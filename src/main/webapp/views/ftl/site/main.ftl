<#-- @ftlvariable name="data" type="com.md.mdboiler.model.BoilerData" -->
<#if data??>
    <div class="boiler-data">
        <#if data.on>
        <div class="boiler-data-item">
            <div class="boiler-data-title">Установленная температура:</div>
            <div class="boiler-data-value">${data.establishedTemperature}</div>
        </div>
        </#if>
        <div class="boiler-data-item">
            <div class="boiler-data-title">Температура с датчика:</div>
            <div class="boiler-data-value">${data.lastTemperatureFromSensor}</div>
        </div>
        <div class="boiler-data-item">
            <div class="boiler-data-title">${data.on?then('Котел включен', 'Котел выключен')}</div>
            <#if data.on>
                <button onclick="changeState(false)" class="button red inline">Выключить</button>
            <#else>
                <button onclick="changeState(true)" class="button inline">Включить</button>
            </#if>
        </div>
    </div>

    <#if data.on>
    <button onclick="setState()" class="button button-set-temperature">Установить температуру</button>
    </#if>
<#else>
    <div class="text center">Нет данных</div>
</#if>

<script type="text/javascript">
    function setState() {
        loadContent("/set-state", "Котел", false);
    }

    function changeState(isOn) {

        loadingIndicator.show();
        contentContainer.hide();

        let request = $.ajax({
            url: '/api/boiler/user',
            type: 'PUT',
            contentType: "application/json",
            data: JSON.stringify({
                "establishedTemperature": ${data.establishedTemperature?c},
                "on": isOn
            })
        });

        request.done(function (data) {
            if (data === 'OK') {
                loadContent("/", "Котел", false);
            }
        });

        request.fail(function (data) {
            loadingIndicator.hide();
            contentContainer.show();
            showDialog('Ошибка с сервера', data);
        });
    }
    </script>