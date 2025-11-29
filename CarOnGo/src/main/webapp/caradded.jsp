<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Car Added Successfully</title>

<style>
 body{
        margin: 0;
        font-family: "Poppins", sans-serif;
       background: url('images/admin-bg.jpg') center/cover no-repeat fixed;
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        color: white;
    }
    .card{
        width: 450px;
        padding: 25px;
        background: rgba(255, 255, 255, 0.75);
        border-radius: 14px;
        box-shadow: 0px 8px 25px rgba(0,0,0,0.4);
        backdrop-filter: blur(8px);
        animation: fadeIn 0.8s ease;
    }
    .card h1{
        text-align: center;
        margin-bottom: 15px;
        font-size: 26px;
        color: #ff4d4d;
    }
    .info{
        margin: 10px 0;
        font-size: 18px;
        color: green;
        font-weight:600;
    }
    .label{
        font-weight: 600;
        color: black;
    }

    .btn{
        width: 90%;
        padding: 12px;
        margin-top: 18px;
        background: #ff4d4d;
        color: black;
        text-align: center;
        border-radius: 8px;
        font-size: 16px;
        text-decoration: none;
        display: block;
        font-weight: 600;
    }
    .btn:hover{
        background:  #ff4d4d;
    }

    @keyframes fadeIn {
        from {opacity: 0; transform: scale(0.85);}
        to {opacity: 1; transform: scale(1);}
    }

</style>

</head>

<body>

    <div class="card">

        <h1>Car Added Successfully!</h1>

        <div class="info"><span class="label">Car Name:</span> <%=request.getAttribute("name") %></div>
        <div class="info"><span class="label">Model:</span><%=request.getAttribute("model") %> </div>
        <div class="info"><span class="label">Price/Day:</span> <%=request.getAttribute("price") %></div>
        <div class="info"><span class="label">Owner:</span> <%=request.getAttribute("owner") %></div>
        <div class="info"><span class="label">Car Number:</span> <%=request.getAttribute("carno") %></div>

        <a class="btn" href="admin.html">Back to Admin Panel</a>

    </div>

</body>
</html>
