<%--
  Created by IntelliJ IDEA.
  User: lcl
  Date: 2019/6/27
  Time: 20:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c"
           uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学生</title>
</head>
<body>






<%--<rapid:override name="head">
    <title>课程信息</title>
</rapid:override>
<rapid:override name="content">--%>
    <%
        String path = request.getContextPath();
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    %>
    <p style="color:red; margin-top:10px; font-size:15px;">${msg}</p>
    <table class="layui-table" style="margin-top:15px;">
        <colgroup>
            <col width="100">
            <col width="120">
            <col width="80">
            <col width="50">
        </colgroup>
        <thead>
        <tr>
            <th>学生id</th>
            <th>学生姓名</th>
            <th>所属学院</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${paging.dataList}" var="student">
            <tr>
                <td>${student.stuId}</td>
                <td>${student.stuName}</td>
                <td>${student.insName}</td>
                <td>
                    <%--<button class="layui-btn" onclick="delete_fun(${student.stuId})" disabled
                            style="background-color: gray;" value="删除">
                    </button>--%>
                    <button value="删除" onclick="delete_fun(${student.stuId})" style="background-color: gray;"></button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div style="text-align:center; margin-top:10px; margin-left:-100px;">
        <c:if test="${paging.totalPage >=0}">
            <p style=" color: black; font-size:16px; margin-bottom:10px;">当前第 ${paging.currentPage }
                页/共 ${paging.totalPage} 页</p>
            <c:choose>
                <c:when test="${paging.totalPage==0}">
                    <button class="layui-btn layui-btn-disabled" onclick="goPage(1)">首页</button>
                    <button class="layui-btn layui-btn-disabled" onclick="goPage(${paging.currentPage-1})">上一页</button>
                    <button class="layui-btn layui-btn-disabled" onclick="goPage(${paging.currentPage+1})">下一页</button>
                    <button class="layui-btn layui-btn-disabled" onclick="goPage(${paging.totalPage})">末页</button>
                </c:when>
                <c:when test="${paging.currentPage==1 && paging.totalPage==1}">
                    <button class="layui-btn" onclick="goPage(1)">首页</button>
                    <button class="layui-btn layui-btn-disabled" onclick="goPage(${paging.currentPage-1})">上一页</button>
                    <button class="layui-btn layui-btn-disabled" onclick="goPage(${paging.currentPage+1})">下一页</button>
                    <button class="layui-btn" onclick="goPage(${paging.totalPage})">末页</button>
                </c:when>
                <c:when test="${paging.currentPage==1 && paging.totalPage>1}">
                    <button class="layui-btn" onclick="goPage(1)">首页</button>
                    <button class="layui-btn layui-btn-disabled" onclick="goPage(${paging.currentPage-1})">上一页</button>
                    <button class="layui-btn" onclick="goPage(${paging.currentPage+1})">下一页</button>
                    <button class="layui-btn" onclick="goPage(${paging.totalPage})">末页</button>
                </c:when>
                <c:when test="${paging.currentPage>1 && paging.currentPage<paging.totalPage}">
                    <button class="layui-btn" onclick="goPage(1)">首页</button>
                    <button class="layui-btn" onclick="goPage(${paging.currentPage-1})">上一页</button>
                    <button class="layui-btn" onclick="goPage(${paging.currentPage+1})">下一页</button>
                    <button class="layui-btn" onclick="goPage(${paging.totalPage})">末页</button>
                </c:when>
                <c:when test="${paging.currentPage>1 && paging.currentPage==paging.totalPage}">
                    <button class="layui-btn" onclick="goPage(1)">首页</button>
                    <button class="layui-btn" onclick="goPage(${paging.currentPage-1})">上一页</button>
                    <button class="layui-btn layui-btn-disabled" onclick="goPage(${paging.currentPage+1})">下一页</button>
                    <button class="layui-btn" onclick="goPage(${paging.totalPage})">末页</button>
                </c:when>
            </c:choose>
        </c:if>
    </div>
    <script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.js"></script>
    <script>
        function searchCourse() {

            var courseid = document.getElementById("search").value;
            if(courseid===""){
                alert("请输入课程编号！");
                window.location.href="#";
            }else
                window.location.href = "<%=basePath%>student/searchCourse?courseid=" + courseid;
        }

        function goPage(page) {
            window.location.href = "<%=basePath%>administrators/queryAllStudent?page=" + page;
        }

        function detail_fun(stuId) {
            window.location.href = "<%=basePath%>student/deleteStudent?stuId=" + stuId;
        }

        function delete_fun(stuId) {
            var r = confirm("确认删除该学生？")
            if (r == true) {
                window.location.href = "<%=basePath%>administrators/deleteStudent?stuId=" + stuId;
            }
            else {
                return;
            }
        }
    </script>
<<%--/rapid:override>/**/--%>
<%--<%@ include file="base.jsp" %>--%>

</body>
</html>
