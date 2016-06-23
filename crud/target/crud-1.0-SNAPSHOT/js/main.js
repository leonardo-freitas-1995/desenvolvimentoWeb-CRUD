$(document).ready(function() {
   $('select').material_select();
 });
 
var db = [];
var removeItem = -1;
var editItem = -1;

function addItem(){
    var name = $("#name").val();
    var count = $("#count").val();
    var price = $("#price").val();
    if (name === "" || count === "" || price === ""){
        Materialize.toast('Informe corretamente os dados do item.', 4000, "red");
        return;
    }
    $.ajax({
            dataType: "text",
            url: "ServletCreateItem",
            data: { name: name, count: count, price: price} ,
            success: function () {
                $("#name").val("");
                $("#count").val("");
                $("#price").val("");
                Materialize.toast('Item adicionado com sucesso!', 4000, "green");
            }
        });
}

function listItems(){
        $.getJSON("ServletListItems", {}, function (data) {
                db = data;
                if (data.length === 0){
                    $("#ListContainer").html("<b>Não existe nenhum item cadastrado</b>");
                }
                else{
                    var html = "<table><thead><tr><th>Nome</th><th>Quantidade</th><th>Preço Unitário</th><th>Preço Total</th><th>Ações</th></tr></thead><tbody>";
                    for (var i = 0; i < data.length; i++){
                        var item = data[i];
                        html += "<tr><td>" +
                                item.name + "</td><td>" +
                                item.count + "</td><td>" +
                                item.price + "</td><td>" +
                                (parseInt(item.count) * parseFloat(item.price)) + "</td><td>" + 
                                "<button class='btn red' style='margin-right: 10px;' onclick='startDelete(" + i + ")'>Deletar</button><button class='btn orange' onclick='startEdit(" + i + ")'>Editar</button></td></tr>";
                    }
                    html += "</tbody></table>";
                    $("#ListContainer").html(html);
                }
            });
}

function startDelete(index){
    removeItem = index;
    $("#RemoveItemName").html(db[index].name);
    $('#modalDelete').openModal();
}

function finishDelete(){
    $.ajax({
            dataType: "text",
            url: "ServletDeleteItem",
            data: { id: db[removeItem]._id} ,
            success: function () {
                Materialize.toast('Item ' + db[removeItem].name + ' removido.', 4000, "red");
                listItems();
            }
        });
}

function startEdit(index){
    var item = db[index];
    editItem = index;
    $("#EditItemName").html(db[index].name);
    $("#name").val(item.name);
    $("#count").val(item.count);
    $("#price").val(item.price);
    $('#modalEdit').openModal();
}

function finishEdit(){
    var name = $("#name").val();
    var count = $("#count").val();
    var price = $("#price").val();
    if (name === "" || count === "" || price === ""){
        Materialize.toast('Informe corretamente os dados do item.', 4000, "red");
        return;
    }
    $.ajax({
            dataType: "text",
            url: "ServletUpdateItem",
            data: {id: db[editItem]._id, name: name, count: count, price: price} ,
            success: function () {
                $("#name").val("");
                $("#count").val("");
                $("#price").val("");
                Materialize.toast('Item atualizado com sucesso!', 4000, "green");
                $('#modalEdit').closeModal();
                listItems();
            }
        });
}