<%@page import="com.alpha.Booking"%>
<%@page import="com.alpha.Car"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Booking Successful</title>

<style>
    body {
        margin: 0;
        font-family: "Poppins", sans-serif;
        background: url('images/admin-bg.jpg') center/cover no-repeat fixed;
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        color: white;
    }

    .card {
        width: 450px;
        padding: 25px;
        background: rgba(255, 255, 255, 0.75);
        border-radius: 14px;
        box-shadow: 0px 8px 25px rgba(0,0,0,0.4);
        backdrop-filter: blur(8px);
        animation: fadeIn 0.8s ease;
        color: black;
    }

    .card h1 {
        text-align: center;
        font-size: 30px;
        margin-bottom: 10px;
        color: green;
        font-weight: 700;
    }

    .info {
        margin: 10px 0;
        font-size: 18px;
        font-weight: 600;
        color: #333;
    }

    .label {
        font-weight: bold;
        color: #000;
    }

    .btn {
        width: 90%;
        padding: 12px;
        margin-top: 18px;
        background: #ff4d4d;
        color: white;
        text-align: center;
        border-radius: 8px;
        font-size: 16px;
        text-decoration: none;
        display: block;
        font-weight: 600;
        margin-left: auto;
        margin-right: auto;
    }

    @keyframes fadeIn {
        from {opacity: 0; transform: scale(0.85);}
        to {opacity: 1; transform: scale(1);}
    }
</style>

</head>
<body>

<%
    Car c = (Car) request.getAttribute("car");
    Booking b = (Booking) request.getAttribute("booking");
%>

<div class="card">
    <h1>Car Booked Successfully! </h1>

    <div class="info"><span class="label">Car Name:</span> <%= c.getName() %></div>
    <div class="info"><span class="label">Model:</span> <%= c.getModel() %></div>
    <div class="info"><span class="label">Price/Day:</span> <%= c.getPrice() %></div>
    <div class="info"><span class="label">Car Number:</span> <%= c.getCarno() %></div>
    <hr>
    <div class="info"><span class="label">Customer:</span> <%= b.getCname() %></div>
    <div class="info"><span class="label">Phone:</span> <%= b.getPhone() %></div>
    <div class="info"><span class="label">From:</span> <%= b.getFromDate() %></div>
    <div class="info"><span class="label">To:</span> <%= b.getToDate() %></div>

    <a href="customer.html" class="btn">Back to Customer Panel</a>
</div>

</body>
</html>
