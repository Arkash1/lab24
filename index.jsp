<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Лабораторная работа №24</title>
</head>
<body>
<h2>Вычисление суммы ряда</h2>
<form>
    Введите предел суммы:
    <input type="text" name="limit" min="1" required />
    <br/>
    Введите x (x &gt; 0):
    <input type="text" name="x" step="any" min="0.0001" required />
    <br/>
    <input type="submit" value="Вычислить" />
</form>
<%
    String limitStr = request.getParameter("limit");
    String xStr = request.getParameter("x");

    if (limitStr != null && xStr != null) {
        try {
            int limit = Integer.parseInt(limitStr);
            double x = Double.parseDouble(xStr);
            if (x <= 0 || limit <= 0) {
%>
                <p>Нельзя использовать эти данные. Убедитесь, что x &gt; 0 и limit &gt; 0.</p>
<%
            } else {
                double result = 0;

                for (int n = 0; n < limit; n++) {
                    int power = 2 * n + 1;
                    result += Math.pow(x - 1, power) / (power * Math.pow(x + 1, power));
                }
%>
                <p>Результат: <%= 2*result %></p>
<%
            }
        } catch (NumberFormatException e) {
%>
            <p>Некорректный ввод. Введите числовые значения.</p>
<%
        }
    }
%>
</body>
</html>
