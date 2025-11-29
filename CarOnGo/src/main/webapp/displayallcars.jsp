<%@page import="com.alpha.Car"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Cars</title>

<style>
    body {
        margin: 0;
        font-family: "Poppins", sans-serif;
        background: url('images/admin-bg.jpg') center/cover no-repeat fixed;
        min-height: 100vh;
        padding: 40px 20px;
        color: white;
    }

    h1 {
        text-align: center;
        margin-bottom: 25px;
        font-size: 35px;
        color: #ff4d4d;
        text-shadow: 0px 4px 15px rgba(0,0,0,0.5);
    }

    /* -------- GRID THAT HOLDS CARDS -------- */
    .grid {
        display: flex;
        flex-wrap: wrap;
        justify-content: center; /* Center even if 1 or 2 cards */
        gap: 30px;
        padding: 10px;
    }

    /* -------- CARD STYLING (same as addcar.html) -------- */
    .card {
        width: 350px;
        padding: 22px;
        background: rgba(255, 255, 255, 0.75);
        border-radius: 14px;
        box-shadow: 0px 8px 25px rgba(0,0,0,0.4);
        backdrop-filter: blur(8px);
        animation: fadeIn 0.8s ease;
    }

    .card h2 {
        text-align: center;
        margin-bottom: 10px;
        font-size: 24px;
        color: #ff4d4d;
        font-weight: bold;
    }

    .detail {
        margin: 8px 0;
        font-size: 18px;
        color: green;
        font-weight: 600;
    }

    .label {
        color: black;
        font-weight: 600;
    }

    .btn {
        width: 260px;
        padding: 12px;
        margin: 30px auto;
        background: #ff4d4d;
        color: black;
        text-align: center;
        border-radius: 8px;
        font-size: 17px;
        text-decoration: none;
        display: block;
        font-weight: 600;
        box-shadow: 0px 5px 15px rgba(0,0,0,0.4);
        transition: 0.3s;
    }

    .btn:hover {
        background: #ff3333;
        transform: scale(1.05);
    }

    @keyframes fadeIn {
        from {opacity: 0; transform: scale(0.85);}
        to {opacity: 1; transform: scale(1);}
    }
</style>
</head>

<body>

    <h1>Available Cars</h1>

    <div class="grid">

        <% 
            List<Car> cars = (List<Car>) request.getAttribute("carlist");
            if (cars != null && !cars.isEmpty()) {
                for (Car c : cars) {
        %>

        <div class="card">
            <h2><%= c.getName() %></h2>

            <div class="detail"><span class="label">Model:</span> <%= c.getModel() %></div>
            <div class="detail"><span class="label">Price/Day:</span> <%= c.getPrice() %></div>
            <div class="detail"><span class="label">Owner:</span> <%= c.getOwner() %></div>
            <div class="detail"><span class="label">Car No:</span> <%= c.getCarno() %></div>
            <div class="detail"><span class="label">Status:</span> <%= c.getStatus() %></div>
        </div>

        <% } } else { %>

        <h2 style="text-align:center; width:100%; color:white;">No cars available.</h2>

        <% } %>

    </div>

    <a href="admin.html" class="btn">Back to Admin Panel</a>

</body>
</html>
