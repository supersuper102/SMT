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
    <div class="content" style="display: flex; justify-content: center; align-items: center; gap: 300px;">




        <!-- Left content: Header and Canvas -->
        <div style="width: 400px;  height: 80vh; text-align: center;">
            <header>
                <h1 style="font-family: Verdana, Geneva, Tahoma, sans-serif;">SMT<br /></h1>
                <p style="font-family: Verdana, Geneva, Tahoma, sans-serif;">MBTI와 관련된 이야기를 공유하고 소통할 수 있는 커뮤니티 입니다.</p>

            </header>

            <div style="width: 400px; height: 400px;">
                <canvas id="mbtiChart"></canvas>
            </div>
        </div>

        <!-- Right content: MBTI Test -->
        <div id="wrap" style="width: 400px;  height: 68vh; text-align: center;">
            <div class="survey-box">
                <div id="mbti-title-box">
                    <h2 id="mbti-title">SAY MBTI TYPE!</h2><h2>MBTI테스트</h2>
                </div>
                <div id="mbti-content">
                    <p>원활한 사이트 이용을 위해 mbti 검사를 진행해주세요! <br>해당 검사는 본 사이트에서 자체 개발한 무료 검사이며<br>각 문항마다 평소와 가까운 답을 선택하면 됩니다.<br>검사를 시작하시려면 시작 버튼을 눌러주세요.</p>
                </div>
                <div>
                    <button id="mbti-start-button" onclick="location.href='/mbtiSurvey'">테스트 시작!</button>

                </div>
            </div>
        </div>
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
