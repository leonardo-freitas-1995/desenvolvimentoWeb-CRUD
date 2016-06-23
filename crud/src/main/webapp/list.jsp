<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>Sistema de Estoque de Itens</title>
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/materialize.min.css"  media="screen,projection"/>


    </head>
    <body>
        <div class="row">
            <div class="col m10 offset-m1">
                <div class="container">
                    <h3>Estoque de Itens</h3>
                    <hr>
                    <h5>Listar Items</h5>
                    <div id="ListContainer">

                    </div>
                </div>
            </div>
        </div>
        
        <div id="modalDelete" class="modal">
          <div class="modal-content">
              <h5>Deseja mesmo deletar o item <b id="RemoveItemName"></b>?</h5>
          </div>
          <div class="modal-footer">
            <a href="#!" class=" modal-action modal-close btn-flat">Não</a>
            <a href="#!" class=" modal-action modal-close btn red" onclick="finishDelete()">Sim</a>
          </div>
        </div>
        
        <div id="modalEdit" class="modal">
          <div class="modal-content">
              <h3>Editando item <b id="EditItemName"></b></h3>
              <hr>
              <div class="container-fluid">
                    <div class="row">
                        <div class="input-field col m8 offset-m2">
                            <input id="name" type="text" class="validate" placeholder="Item" required>
                            <label for="name">Nome</label>
                        </div>
                    </div>
                </div>
                <div class="container-fluid">
                    <div class="row">
                        <div class="input-field col m8 offset-m2">
                            <input id="count" type="number" class="validate" min="0" placeholder="1" required>
                            <label for="count">Quantidade</label>
                        </div>
                    </div>
                </div>
                <div class="container-fluid">
                    <div class="row">
                        <div class="input-field col m8 offset-m2">
                            <input id="price" type="text" class="validate" pattern="\d+(\.\d{2})?" placeholder="1.00" required>
                            <label for="price">Preço Unitário</label>
                        </div>
                    </div>
                </div>
          </div>
          <div class="modal-footer">
            <a href="#!" class="modal-action modal-close btn-flat">Fechar</a>
            <a href="#!" class="btn green" onclick="finishEdit()">Salvar</a>
          </div>
        </div>
        <div class="container divider"></div>
        <br>
        <br>
        <div class="center-align">
            <a class="btn" href="index.jsp">Adicionar Item</a>
        </div>


        <script src="${pageContext.request.contextPath}/js/jquery-2.1.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/materialize.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/main.js"></script>
        <script>
            listItems();
        </script>
    </body>
</html>
