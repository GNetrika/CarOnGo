<%@page import="com.alpha.Car"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Available Cars</title>

<style>
    body {
        margin: 0;
        font-family: "Poppins", sans-serif;
        background: url('images/admin-bg.jpg') center/cover no-repeat fixed;
        min-height: 100vh;
        padding: 40px;
        color: white;
    }

    h1 {
        text-align: center;
        font-size: 38px;
        margin-bottom: 25px;
        color: #ff4d4d;
        text-shadow: 0 0 8px rgba(0,0,0,0.5);
    }

    /* GRID 3 cards per row */
    .grid {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 25px;
    padding: 0 20px;
    align-items: start;   /* <-- IMPORTANT FIX */
	}


    /* CARD DESIGN */
    .card {
    position: relative;
        background: rgba(255, 255, 255, 0.75);
        padding: 20px;
        border-radius: 14px;
        color: black;
        box-shadow: 0px 8px 25px rgba(0,0,0,0.4);
        backdrop-filter: blur(8px);
        animation: fadeIn 0.8s ease;
    }

    .card h2 {
        color: #ff4d4d;
        font-size: 24px;
        margin-bottom: 10px;
        text-align: center;
    }

    .detail {
        margin-bottom: 8px;
        font-size: 16px;
        color: green;
        font-weight: 600;
    }

    .label {
        color: black;
        font-weight: 700;
    }

    .btn {
        width: 100%;
        padding: 12px;
        background: #ff4d4d;
        border: none;
        color: black;
        margin-top: 10px;
        border-radius: 8px;
        cursor: pointer;
        font-size: 16px;
        font-weight: 600;
        transition: .3s;
    }

    .btn:hover {
        background: #ff3333;
        transform: scale(1.05);
    }

    /* Hidden booking form */
    .booking-box {
        margin-top: 15px;
        padding: 14px;
        background: rgba(255, 255, 255, 0.85);
        border-radius: 10px;
        display: none;
    }

    .booking-box input {
        width: 100%;
        padding: 8px;
        margin: 8px 0;
        border-radius: 6px;
        border: 1px solid #777;
    }

    .submit-btn {
        background: #00c853;
        padding: 12px;
        border: none;
        width: 100%;
        border-radius: 6px;
        font-weight: bold;
        cursor: pointer;
        color: white;
        margin-top: 10px;
    }

    .submit-btn:hover {
        background: #009f40;
    }
    @keyframes expand {
    from { opacity: 0; transform: scale(0.9); }
    to { opacity: 1; transform: scale(1); }
}

    @keyframes fadeIn {
        from {opacity: 0; transform: scale(0.85);}
        to {opacity: 1; transform: scale(1);}
    }

    /* RESPONSIVE */
    @media (max-width: 1100px) {
        .grid { grid-template-columns: repeat(2, 1fr); }
    }

    @media (max-width: 650px) {
        .grid { grid-template-columns: repeat(1, 1fr); }
    }
</style>

<script>
function openForm(id){
    document.getElementById("form"+id).style.display = "block";
}
</script>

</head>

<body>

    <h1>Available Cars</h1>

    <div class="grid">

        <% 
            List<Car> cars = (List<Car>) request.getAttribute("carlist");
            if(cars != null && !cars.isEmpty()){
                for(Car c : cars){
        %>

        <!-- CARD -->
        <div class="card">
            <h2><%= c.getName() %></h2>

            <div class="detail"><span class="label">Model: </span> <%= c.getModel() %></div>
            <div class="detail"><span class="label">Price/Day: </span> <%= c.getPrice() %></div>
            <div class="detail"><span class="label">Owner: </span> <%= c.getOwner() %></div>
            <div class="detail"><span class="label">Car No: </span> <%= c.getCarno() %></div>
            <div class="detail"><span class="label">Status: </span> <%= c.getStatus() %></div>

            <button class="btn" onclick="openForm(<%= c.getId() %>)">Book Now</button>

            <!-- BOOKING FORM (hidden) -->
            <div id="form<%= c.getId() %>" class="booking-box">

                <form action="bookcar" method="get">
                    <input type="hidden" name="carid" value="<%= c.getId() %>">

                    <label>Customer Name</label>
                    <input type="text" name="cname" required>

                    <label>Phone Number</label>
                    <input type="tel" name="phone" required>

                    <label>From Date</label>
                    <input type="date" name="fromdate" required>

                    <label>To Date</label>
                    <input type="date" name="todate" required>

                    <button type="submit" class="submit-btn">Confirm Booking</button>
                </form>

            </div>
        </div>

        <% } } else { %>

            <h2 style="grid-column: 1/4; text-align:center;">No cars available.</h2>

        <% } %>

    </div>

</body>
</html>
