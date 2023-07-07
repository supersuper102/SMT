<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
<%
    String url = "jdbc:oracle:thin:@localhost:1521:xe";
    String user = "smt"; 
    String password = "tiger";

    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;

    ArrayList<Integer> mbtiData = new ArrayList<>();

    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        conn = DriverManager.getConnection(url, user, password);
        stmt = conn.createStatement();
        String sql = "SELECT mbti_type, COUNT(*) FROM member GROUP BY mbti_type ORDER BY mbti_type";
        rs = stmt.executeQuery(sql);

        while (rs.next()) {
            mbtiData.add(rs.getInt(2)); 
        }

    } catch (ClassNotFoundException | SQLException e) {
        e.printStackTrace();
    } finally {
        if (rs != null) try { rs.close(); } catch(SQLException ex) {}
        if (stmt != null) try { stmt.close(); } catch(SQLException ex) {}
        if (conn != null) try { conn.close(); } catch(SQLException ex) {}
    }

    String dataForJs = mbtiData.toString();
%>

<script>
    var data = <%= dataForJs %>;
</script>

<section id="banner">
    <div class="content">
        <header>
            <h1>
                Hi, I’m Editorial<br /> by HTML5 UP
            </h1>
            <p>A free and fully responsive site template</p>
        </header>

        
        <div style="width: 400px; height: 400px;">
            <canvas id="mbtiChart"></canvas>
        </div>

        <ul class="actions"></ul>
    </div>
</section>

<script>
    var ctx = document.getElementById('mbtiChart').getContext('2d');
    var myChart = new Chart(ctx, {
        type: 'pie',
        data: {
            labels: ['ENTJ', 'INTJ', 'ENTP', 'INTP', 'ENFJ', 'INFJ', 'ENFP', 'INFP', 'ESTJ', 'ISTJ', 'ESTP', 'ISTP', 'ESFJ', 'ISFJ', 'ESFP', 'ISFP'],
            datasets: [{
                data: data,
             
                backgroundColor: [
                    '#FF6384', '#36A2EB', '#FFCE56', '#BA68C8', 
                    '#4DB6AC', '#FF8A65', '#7986CB', '#AED581',
                    '#DCE775', '#FFF176', '#FFD54F', '#FFB74D',
                    '#FF8A65', '#A1887F', '#90A4AE', '#B0BEC5'
                ],
                borderWidth: 1
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false
        }
    });
</script>
</body>
</html>