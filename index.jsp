<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Вычисление суммы ряда</title>
</head>
<body>
<h2>Вычисление суммы ряда</h2>
<form method="post">
    Верхний предел (n): <input type="number" name="z" required><br><br>
    Значение x (x > 0.5): <input type="number" step="any" name="x" required><br><br>
    <input type="submit" value="Рассчитать">
</form>

<%
if ("POST".equals(request.getMethod())) {
    try {
        int z = Integer.parseInt(request.getParameter("z"));
        double x = Double.parseDouble(request.getParameter("x"));
        double sum = 0;

        if (x > 0.5) {
            for (int n = 0; n < z; n++) {
                double temp = Math.pow(x-1, n+1) / ((n+1) * Math.pow(x+1, n+1));
                sum += temp;
            }
            out.println("<h3>Результат: " + sum + "</h3>");
        } else {
            out.println("<p style='color:red'>Ошибка: x должен быть больше 0.5!</p>");
        }
    } catch (Exception e) {
        out.println("<p style='color:red'>Ошибка ввода данных!</p>");
    }
}
%>
</body>
</html>
