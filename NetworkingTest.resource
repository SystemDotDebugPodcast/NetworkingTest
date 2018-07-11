var constants = {
    useVanillaJS: true
}

var insertStringIntoTextAreaUsingVanillaJS = function(id, string) {
    var textarea = document.getElementById(id);
    textarea.innerText = string;
}

var insertStringIntoTextAreaUsingJQuery = function(id, string) {
    var textarea = $('#'+id);
    textarea.text(string);
}

var insertStringIntoTextArea = function(id, string) {
    if(constants.useVanillaJS) {
        insertStringIntoTextAreaUsingVanillaJS(id, string);
    } else {
        insertStringIntoTextAreaUsingJQuery(id, string);
    }
}

var formatDataForTextArea = function(data) {
    return data.replace(/,/ig, ',\r\n\t').replace(/{/g, '{\r\n\t');
}

var performCallToAPI = function() {
    $.ajax({
        url: 'http://www.postpwnd.com/testAPI.php',
        type: 'GET',
        dataType: 'JSON',
    }).done(function (res) {
        
        console.dir(res);
        var data = JSON.stringify(res.data, null, 2);
        
        console.log(data);
        insertStringIntoTextArea('ajaxresponse', data);
        
    }).error(function (e) {
        //something broke!
        console.error(e);
    });
}
