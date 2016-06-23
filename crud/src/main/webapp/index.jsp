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
        <div class="col m6 offset-m3">
            <div class="container">
                <h3>Estoque de Itens</h3>
                <hr>
                <h5>Adicionar novo item</h5>
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
                <div class="container-fluid">
                    <div class="row">
                        <div class="col m8 offset-m2 center-align">
                            <button class="waves-effect waves-light btn green" onclick="addItem()">Adicionar</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="divider"></div>
            <br>
            <br>
            <div class="center-align">
                <a class="btn" href="list.jsp">Listar Itens</a>
            </div>
        </div>
    </div>


    <script src="${pageContext.request.contextPath}/js/jquery-2.1.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/materialize.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/main.js"></script>
    </body>
</html>
