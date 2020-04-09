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
    <title>商品选择界面</title>
    <link rel="stylesheet" href="../../css/bootstrap.min.css">
    <script src="../../js/jquery-3.2.1.min.js"></script>
    <script src="../../js/bootstrap.min.js"></script>
    <script type="text/javascript">


        var cart=[];

        /*
         表格选择提示
         */
          $(function(){
              $('input:checkbox').click(function () {
                  //判断当前选款是否被选中
                  //alert($('input:checked').is(':checked'));
                  if($(this).is(':checked')){
                      var id=$(this).parents('tr').find('td').eq(1).text();
                       var name=$(this).parents('tr').find('td').eq(2).text();
                      //已选中时
                      alert("感谢选择【"+name+"】");
                      //添加商品
                      var Item={"id":id,"name":name};
                      cart.push(Item);
                     // alert(cart.toString());

                  }else {
                     var id=$(this).parents('tr').find('td').eq(1).text();
                     var  unchoose=$("input:hover").parents('tr').find('td').eq(2).text();
                      //未选中时
                      alert("取消选择【"+unchoose+"】");
                     //去除商品
                      var Item={"id":id,"name":unchoose};

                      //删除方法有问题暂时没时间解决
                     removeArray(cart,Item);
                     // alert(cart.toString());

                  }

                  }
                  )

        });

        /*删除数组中的某一个对象
        _arr:数组
        _obj:需删除的对象
          */
        function removeArray(_arr, _obj) {
            var length = _arr.length;
            for (var i = 0; i < length; i++) {
               // alert(_arr[i] == _obj);
                if (_arr[i] == _obj) {
                    if (i == 0) {
                        _arr.shift(); //删除并返回数组的第一个元素
                        return _arr;
                    }
                    else if (i == length - 1) {
                        _arr.pop();  //删除并返回数组的最后一个元素
                        return _arr;
                    }
                    else {
                        _arr.splice(i, 1); //删除下标为i的元素
                        return _arr;
                    }
                }
            }
        }



          /*
          添加到购物车中
           */
      function addCart() {
              //判断cart中是否为空
              if(cart.length<=0){
                  alert("没有勾选任何商品");
              }else {
                  $.ajax({
                      type: 'post',
                      contentType: "application/json;charset=UTF-8",
                      url: "/addCart",
                      data: JSON.stringify(cart),
                      dataType: 'text',
                      async:false,
                      success: function (data) {
                         //alert(data);
                         alert("添加成功");
                          //刷新界面
                          window.location.reload();
                      }
                  });
              }
      }





    </script>
</head>
<body>
<div style="background-color: white;">
<table  width="100%" cellpadding="0" cellspacing="0" id="tab">
    <h4>电器商品</h4>
    <h5>请选择商品</h5>
    <tr >
        <td style="width: 30px">

       </td>
    <td>ID</td>
    <td>商品名称</td>
</tr>
    <c:forEach items="${items}" var="item" varStatus="index" >
       <tr>
           <td style="width: 30px">
               <input type="checkbox" name="items" id="item"  />
           </td>
        <td>${item.id}</td>
        <td>${item.name}</td>
       </tr>
    </c:forEach>

</table>
    <pl></pl>
    <input  id="button" type="button" value="加入购物车" onclick="addCart();">
    <br/>
    <h4><a href="/cart">我的购物车</a></h4>
    </div>
</body>
</html>
