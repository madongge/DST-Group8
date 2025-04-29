<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>Search Drug</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">

    <h2>Drug Search Results</h2>

    <!-- 显示查询结果 -->
        <div class="table-responsive">
            <table class="table table-striped table-bordered">
                <thead class="thead-light">
                <tr>
                    <th>#</th>
                    <th>Drug Name</th>
                    <th>Summary (Markdown)</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${results}" var="item" varStatus="status">
                    <tr>
                        <td>${status.index + 1}</td> <!-- 自动编号 -->
                        <td>${item[1]}</td>           <!-- name -->
                        <td>${item[2]}</td>           <!-- summary_markdown -->
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>

    <!-- 如果没有查到结果，显示提示 -->
        <div class="alert alert-warning mt-4" role="alert">
            No drugs found matching your search.
        </div>

</div>

</body>
</html>
