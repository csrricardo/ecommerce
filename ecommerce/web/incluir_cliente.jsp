<%-- 
    Document   : incluir_cliente
    Created on : 07/11/2016, 08:25:40
    Author     : Alunos
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Fatec Shop - Inclusão de Novo Usuario</title>
    </head>
    <body>
        <h1>Fatec Shop - Novo Usuario</h1>
        <%
            String nome = request.getParameter("name");
            String endereco = request.getParameter("endereco");
            String cidade = request.getParameter("cidade");
            String estado = request.getParameter("estado");
            String email = request.getParameter("email");
            String senha = request.getParameter("senha");
            
            InitialContext contexto = new InitialContext();
            DataSource ds = (DataSource)contexto.lookup("jdbc/loja");
            Connection conexao = ds.getConnection();
            
            String sql = "INSERT INTO cliente" 
                    + "(nome, endereco, cidade, estado, email, senha)" 
                    + "VALUES (?, ?, ?, ?, ?, ?)";
            
            PreparedStatement comando = conexao.prepareStatement(sql);
            comando.setString(1, nome);
            comando.setString(2, endereco);
            comando.setString(3, cidade);
            comando.setString(4, estado);
            comando.setString(5, email);
            comando.setString(6, senha);
            
            int registrosIncluidos = comando.executeUpdate();
            
            if (registrosIncluidos > 0) {
                out.print("<h3>Usuario cadastrado com sucesso!</h3>");
                
            } else {            
            %>
            <h3 style="color: red"FALHA NA INSCRIÇÃO</h3>
            <%
            }
            conexao.close();
            %>
            <a href="index.html">Voltar ao Inicio</a>
    </body>
</html>
