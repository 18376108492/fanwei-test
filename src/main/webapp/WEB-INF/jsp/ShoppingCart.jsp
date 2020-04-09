<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/4/8 0008
  Time: 12:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>购物车</title>
    <link rel="stylesheet" href="../../css/bootstrap.min.css">
    <script src="../../js/jquery-3.2.1.min.js"></script>
    <script src="../../js/bootstrap.min.js"></script>
    <script type="text/javascript">
        
        function deleteCart(id) {
                $.ajax({
                type: 'post',
                contentType:"application/json;charset=UTF-8",
                url: "/delete",
                data: JSON.stringify(id),
                dataType: 'text',
                async:false,
                success: function(data) {
                    alert("添加成功");
                    window.location.reload();
                }
            });

        }
        
    </script>
</head>

<h2 >你放在购物篮里的商品是:</h2>
<table  width="100%" cellpadding="0" cellspacing="0" id="tab">
<tr >
    <td>商品名称</td>
    <td>
        <form action="/sreach" type="get">
            <input type="text"> 模糊查询
        </form>
       </td>
</tr>
<c:forEach items="${carts}" var="ca">
    <tr>
    <td>${ca.name}</td>
    <td><button onclick="deleteCart(${ca.id})">删除</button></td>
    </tr>
    </c:forEach>
</table>
<br/>
<h4 ><a href="/">继续选购</a></h4>
</body>
</html>
