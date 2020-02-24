<#-- @ftlvariable name="data" type="com.md.mdboiler.model.BoilerData" -->
<form id="edit_data" action="/api/boiler/user">

    <label>Температура
        <input id="establishedTemperature" name="establishedTemperature" class="input_green" type="number"/>
    </label>

    <input type="submit" class="button"/>

</form>

<script type="text/javascript">
    let form = $('#edit_data');

    form.submit(function () {

        let request = $.ajax({
            url: form.attr('action'),
            type: 'PUT',
            contentType: 'application/json',
            data: JSON.stringify({
                "establishedTemperature": $('#establishedTemperature').val(),
                "isOn": true
            })
        });

        request.done(function (data) {
            if (data === 'OK') {
                loadContent("/", "Котел", false);
            }
        });

        request.fail(function (data) {
            showDialog('Ошибка с сервера', data);
        });

        return false;
    });
</script>