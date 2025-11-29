<%@page import="com.alpha.Car"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Booking Completed</title>

<style>
    body {
        margin: 0;
        font-family: "Poppins", sans-serif;
        background: linear-gradient(135deg, #32e0c4, #0d7377);
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        color: white;
    }

    .card {
        width: 420px;
        padding: 25px;
        background: rgba(255, 255, 255, 0.75);
        border-radius: 14px;
        box-shadow: 0px 8px 25px rgba(0,0,0,0.4);
        backdrop-filter: blur(8px);
        animation: fadeIn 0.7s ease-in-out;
        color: black;
        text-align: center;
    }

    h1 {
        color: green;
        font-size: 30px;
        margin-bottom: 10px;
    }

    .detail {
        font-size: 18px;
        margin: 8px 0;
        font-weight: 600;
        color: #333;
    }

    .label {
        font-weight: 700;
        color: #ff4d4d;
    }

    .btn {
        margin-top: 20px;
        padding: 12px 20px;
        background: #ff4d4d;
        color: white;
        border-radius: 8px;
        font-size: 16px;
        text-decoration: none;
        display: inline-block;
        transition: .3s;
        font-weight: bold;
    }

    .btn:hover {
        transform: scale(1.05);
        background: #ff3333;
    }

    @keyframes fadeIn {
        from {opacity: 0; transform: translateY(20px);}
        to {opacity: 1; transform: translateY(0);}
    }
</style>

</head>
<body>

<%
    Car c = (Car) request.getAttribute("car");
%>

<div class="card">

    <h1>Booking Completed</h1>
    <p>Your booking has been successfully completed.</p>

    <div class="detail"><span class="label">Car Name: </span> <%= c.getName() %></div>
    <div class="detail"><span class="label">Model: </span> <%= c.getModel() %></div>
    <div class="detail"><span class="label">Price/Day: </span> <%= c.getPrice() %></div>
    <div class="detail"><span class="label">Owner: </span> <%= c.getOwner() %></div>
    <div class="detail"><span class="label">Car No: </span> <%= c.getCarno() %></div>

    <a href="customer.html" class="btn">Back to Customer Panel</a>

</div>

</body>
</html>
