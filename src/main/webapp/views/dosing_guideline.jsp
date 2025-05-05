<%--&lt;%&ndash;--%>
<%--  Created by IntelliJ IDEA.--%>
<%--  User: hello--%>
<%--  Date: 2019-12-3--%>
<%--  Time: 15:37--%>
<%--  To change this template use File | Settings | File Templates.--%>
<%--&ndash;%&gt;--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>
<%--<%@ page isELIgnored="false" %>--%>

<%--<!doctype html>--%>
<%--<html lang="en">--%>
<%--<head>--%>
<%--    <meta charset="utf-8">--%>
<%--    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">--%>
<%--    <meta name="description" content="">--%>
<%--    <meta name="author" content="">--%>
<%--    <meta name="generator" content="">--%>
<%--    <title>Dashboard Template · Bootstrap</title>--%>

<%--    <!-- Bootstrap core CSS -->--%>
<%--    <link href="<%=request.getContextPath()%>/static/bootstrap/css/bootstrap.css" rel="stylesheet">--%>
<%--    <script src="<%=request.getContextPath()%>/static/jquery/jquery-3.4.1.js"></script>--%>
<%--    <script src="<%=request.getContextPath()%>/static/bootstrap/js/bootstrap.bundle.min.js"></script>--%>
<%--    <!-- Custom styles for this template -->--%>
<%--    <link href="<%=request.getContextPath()%>/static/css/app.css" rel="stylesheet">--%>
<%--    <style>--%>
<%--        .bd-placeholder-img {--%>
<%--            font-size: 1.125rem;--%>
<%--            text-anchor: middle;--%>
<%--            -webkit-user-select: none;--%>
<%--            -moz-user-select: none;--%>
<%--            -ms-user-select: none;--%>
<%--            user-select: none;--%>
<%--        }--%>

<%--        @media (min-width: 768px) {--%>
<%--            .bd-placeholder-img-lg {--%>
<%--                font-size: 3.5rem;--%>
<%--            }--%>
<%--        }--%>
<%--    </style>--%>
<%--</head>--%>
<%--<body>--%>
<%--&lt;%&ndash;<jsp:include page="head.jsp" />&ndash;%&gt;--%>

<%--<div class="container-fluid">--%>
<%--    <div class="row">--%>
<%--        <jsp:include page="nav.jsp" >--%>
<%--            <jsp:param name="active" value="dosing_guideline" />--%>
<%--        </jsp:include>--%>

<%--        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">--%>
<%--            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">--%>
<%--                <h2>Dosing Guidelines</h2>--%>
<%--            </div>--%>
<%--            <div class="table-responsive">--%>
<%--                <table class="table table-striped table-sm">--%>
<%--                    <thead>--%>
<%--                    <tr>--%>
<%--                        <th>#</th>--%>
<%--                        <th>Name</th>--%>
<%--                        <th>Recommendation</th>--%>
<%--                        <th>Drug Id</th>--%>
<%--                        <th>Source</th>--%>
<%--                        <th>Summary Markdown</th>--%>
<%--                    </tr>--%>
<%--                    </thead>--%>
<%--                    <tbody>--%>
<%--                    <c:forEach items="${dosingGuidelines}" var="item">--%>
<%--                        <tr>--%>
<%--                            <td>${item.id}</td>--%>
<%--                            <td>${item.name}</td>--%>
<%--                            <td>${item.recommendation}</td>--%>
<%--                            <td>${item.drugId}</td>--%>
<%--                            <td>${item.source}</td>--%>
<%--                            <td>${item.summaryMarkdown}</td>--%>
<%--                        </tr>--%>
<%--                    </c:forEach>--%>

<%--                    </tbody>--%>
<%--                </table>--%>
<%--            </div>--%>
<%--        </main>--%>
<%--    </div>--%>
<%--</div>--%>
<%--</body>--%>
<%--</html>--%>
<%--
  Created by IntelliJ IDEA.
  User: hello
  Date: 2019-12-3
  Time: 15:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta name="generator" content="">
    <title>Dashboard Template · Bootstrap</title>

    <!-- Bootstrap core CSS -->
    <link href="<%=request.getContextPath()%>/static/bootstrap/css/bootstrap.css" rel="stylesheet">
    <script src="<%=request.getContextPath()%>/static/jquery/jquery-3.4.1.js"></script>
    <script src="<%=request.getContextPath()%>/static/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- 引入 Chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <!-- Custom styles for this template -->
    <style>
        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }

        /* Set a fixed height for the chart cells */
        .chart-cell {
            height: 150px;
        }

        /* Cells used for displaying text messages */
        .message-cell {
            height: 150px;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            background-color: #f8f9fa;
            border: 1px solid #dee2e6;
            border-radius: 0.25rem;
        }
    </style>
</head>
<body>

<div class="container-fluid">
    <div class="row">
        <jsp:include page="nav.jsp">
            <jsp:param name="active" value="dosing_guideline" />
        </jsp:include>

        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                <h2>Dosing Guidelines</h2>
            </div>
            <div class="table-responsive">
                <table class="table table-striped table-sm">
                    <thead>
                    <tr>
                        <th>#</th>
                        <th>Name</th>
                        <th>Recommendation</th>
                        <th>Drug Id</th>
                        <th>Source</th>
                        <th>Summary Markdown</th>
                        <th>Dose Adjustment Recommendations</th> <!-- 新增列 -->
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${dosingGuidelines}" var="item" varStatus="loop">
                        <tr>
                            <td>${item.id}</td>
                            <td>${item.name}</td>
                            <td>${item.recommendation}</td>
                            <td>${item.drugId}</td>
                            <td>${item.source}</td>
                            <td>${item.summaryMarkdown}</td>
                            <td class="chart-cell">
                                <canvas id="chart_${loop.index}"></canvas>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>

            <script>
                document.addEventListener('DOMContentLoaded', function () {
                    // Obtain all the table rows
                    const tableRows = document.querySelectorAll('tbody tr');

                    // Traverse each line
                    tableRows.forEach((row, rowIndex) => {
                        // Get the Summary Markdown cell
                        const summaryMarkdownCell = row.cells[5];
                        const markdownText = summaryMarkdownCell.textContent;

                        // Initialize the recommendation information object
                        const recommendation = {
                            percentValues: [],
                            foldChange: [],
                            reduction: false,
                            increase: false,
                            text: markdownText
                        };

                        // Define regular expressions
                        const regexPercent = /(\d+)(?:-(\d+))?%/g;
                        const regexFold = /(\d+)\-fold/g;
                        const regexReduction = /reduce|decrease|low|reduction|decreasing|reducing/g;
                        const regexIncrease = /increase|higher|increasing|double|times/g;

                        // Extract the percentage
                        let matchPercent;
                        while ((matchPercent = regexPercent.exec(markdownText)) !== null) {
                            const min = parseInt(matchPercent[1]);
                            const max = matchPercent[2] ? parseInt(matchPercent[2]) : min;
                            recommendation.percentValues.push({ min, max });
                        }

                        // Extraction multiple variation
                        let matchFold;
                        while ((matchFold = regexFold.exec(markdownText)) !== null) {
                            recommendation.foldChange.push({
                                value: parseInt(matchFold[1])
                            });
                        }

                        // Determine whether it includes suggestions for reducing the dose
                        if (regexReduction.test(markdownText)) {
                            recommendation.reduction = true;
                        }

                        // Determine whether it includes suggestions for increasing the dose
                        if (regexIncrease.test(markdownText)) {
                            recommendation.increase = true;
                        }

                        // If there is data with multiple changes, it is defaulted to increase
                        if (recommendation.foldChange.length > 0) {
                            recommendation.increase = true;
                            recommendation.reduction = false;
                        }
                        // If there is percentage data, it is reduced by default
                        else if (recommendation.percentValues.length > 0) {
                            recommendation.reduction = true;
                            recommendation.increase = false;
                        }

                        // Obtain the chart cell and the canvas element
                        const chartCell = row.cells[6];
                        const canvasElement = chartCell.querySelector('canvas');

                        // If there is no relevant information, display the message
                        if (recommendation.percentValues.length === 0 && recommendation.foldChange.length === 0 && !recommendation.reduction && !recommendation.increase) {
                            chartCell.innerHTML = '<div class="message-cell">No dosing recommendations available or select an alternative drug</div>';
                            return;
                        }

                        // Debugging: Output the extracted data
                        console.log(`Row ${rowIndex} - Percent Values:`, recommendation.percentValues);
                        console.log(`Row ${rowIndex} - Fold Change:`, recommendation.foldChange);
                        console.log(`Row ${rowIndex} - Reduction:`, recommendation.reduction);
                        console.log(`Row ${rowIndex} - Increase:`, recommendation.increase);

                        // draw charts
                        const ctx = canvasElement.getContext('2d');
                        new Chart(ctx, {
                            type: 'bar',
                            data: {
                                labels: ['Percentage', 'Fold Change', 'Reduction', 'Increase'],
                                datasets: [{
                                    label: 'Dose Adjustment',
                                    data: [
                                        recommendation.percentValues.length > 0 ?
                                            (recommendation.percentValues[0].min + recommendation.percentValues[0].max) / 200 :
                                            0,
                                        recommendation.foldChange.length > 0 ?
                                            recommendation.foldChange[0].value :
                                            0,
                                        recommendation.reduction ? 1 : 0,
                                        recommendation.increase ? 1 : 0
                                    ],
                                    backgroundColor: [
                                        'rgba(75, 192, 192, 0.7)',
                                        'rgba(255, 99, 132, 0.7)',
                                        'rgba(255, 159, 64, 0.7)',
                                        'rgba(54, 162, 235, 0.7)'
                                    ],
                                    borderColor: [
                                        'rgba(75, 192, 192, 1)',
                                        'rgba(255, 99, 132, 1)',
                                        'rgba(255, 159, 64, 1)',
                                        'rgba(54, 162, 235, 1)'
                                    ],
                                    borderWidth: 1
                                }]
                            },
                            options: {
                                responsive: true,
                                maintainAspectRatio: false,
                                scales: {
                                    y: {
                                        beginAtZero: true,
                                        max: Math.max(
                                            recommendation.percentValues.length > 0 ? 1 : 0,
                                            recommendation.foldChange.length > 0 ? recommendation.foldChange[0].value : 0,
                                            recommendation.reduction ? 1 : 0,
                                            recommendation.increase ? 1 : 0
                                        ),
                                        title: {
                                            display: true,
                                            text: 'Value'
                                        }
                                    }
                                },
                                plugins: {
                                    legend: {
                                        display: false
                                    },
                                    tooltip: {
                                        callbacks: {
                                            label: function(context) {
                                                const value = context.raw;
                                                if (context.label === 'Percentage' && value !== 0) {
                                                    const originalValue = recommendation.percentValues.length > 0 ?
                                                        (recommendation.percentValues[0].min === recommendation.percentValues[0].max ?
                                                            `${recommendation.percentValues[0].min}%` :
                                                            `${recommendation.percentValues[0].min}-${recommendation.percentValues[0].max}%`) :
                                                        'N/A';
                                                    return originalValue;
                                                } else if (context.label === 'Fold Change' && value !== 0) {
                                                    const originalValue = recommendation.foldChange.length > 0 ?
                                                        `${recommendation.foldChange[0].value}-fold` :
                                                        'N/A';
                                                    return originalValue;
                                                } else if (context.label === 'Reduction') {
                                                    return recommendation.reduction ? 'Yes' : 'No';
                                                } else if (context.label === 'Increase') {
                                                    return recommendation.increase ? 'Yes' : 'No';
                                                }
                                                return value;
                                            }
                                        }
                                    }
                                }
                            }
                        });
                    });
                });
            </script>
        </main>
    </div>
</div>
</body>
</html>