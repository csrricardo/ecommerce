<%-- 
    Document   : listarclientes
    Created on : 10/10/2016, 08:54:06
    Author     : Alunos
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Fatec Shop - Listagem de Clientes</title>
    </head>
    <body>
        <h1>Listagem de Clientes</h1>
        <%
        InitialContext contexto = new InitialContext();
        DataSource ds = (DataSource)contexto.lookup("jdbc/loja");
        Connection conexao = ds.getConnection();
        String sql = "SELECT * FROM clientes ORDER BY nome";
        PreparedStatement comando = conexao.prepareStatement(sql);
        ResultSet res = comando.executeQuery();
        out.println("<table border=1>");
         out.println("<tr>"
                    + "<th>Id</th>"
                    + "<th>Nome</th>" 
                    + "<th>Endereço</th>"
                    + "<th>Cidade</th>"
                    + "<th>Estado</th>"
                    + "<th>EMail</th>"
                    + "<th>Senha</th>"
                    + "</tr>");
        while(res.next()){
            out.println("<tr>" 
                    + "<td>" + res.getInt("id") + "</td>" 
                    + "<td>" + res.getString("nome") + "</td>" 
                    + "<td>" + res.getString("endereco") + "</td>" 
                    + "<td>" + res.getString("cidade") + "</td>"
                    + "<td>" + res.getString("estado") + "</td>"
                    + "<td>" + res.getString("email") + "</td>"
                    + "<td>" + res.getString("senha") + "</td>"
                    + "</tr>");                   
        }
        out.println("</table>");
        conexao.close();
        %>
    </body>
</html>
