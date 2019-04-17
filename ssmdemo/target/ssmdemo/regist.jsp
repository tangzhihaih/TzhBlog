<%@ page contentType="text/html;charset=UTF-8" language="java" %>
 <html>
   <head>
     <title>Login</title>
   </head>
   <body>
     <form action="/ssmdemo/user/regist" method="post">
       用户名:<input type="text" name="username" id="username"/>
       <br>
       密码:<input type="password" name="password" id="password"/>
       <br>
        电话:<input type="text" name="uphone" id="uphone"/>
       <br>
   qq:<input type="text" name="uqq" id="uqq"/>
       <br>
       <input type="submit" value="登录"/>
     
     </form>
   </body>
 </html>