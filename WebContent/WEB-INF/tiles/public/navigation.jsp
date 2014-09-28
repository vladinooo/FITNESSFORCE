<div id="MainMenu">
  <div class="list-group panel">
    <a href="#" class="list-group-item list-group-item-success" data-toggle="collapse" data-parent="#MainMenu">Profile</a>
    <a href="#" class="list-group-item list-group-item-success" data-toggle="collapse" data-parent="#MainMenu">Photo</a>
    <a href="#" class="list-group-item list-group-item-success" data-toggle="collapse" data-parent="#MainMenu">Account</a>
    <a href="#credit" class="list-group-item list-group-item-success" data-toggle="collapse" data-parent="#MainMenu">Credit</a>
    <div class="collapse submenu" id="credit">
      <a href="<c:url value='credit_status'/>" class="list-group-item list-group-item-success">- Status</a>
      <a href="<c:url value='credit_topup'/>" class="list-group-item list-group-item-success">- Buy credit</a>
      <a href="<c:url value='credit_history'/>" class="list-group-item list-group-item-success">- History</a>
    </div>
    <a href="#bookings" class="list-group-item list-group-item-success" data-toggle="collapse" data-parent="#MainMenu">Bookings</a>
    <div class="collapse submenu" id="bookings">
      <a href="" class="list-group-item list-group-item-success">- Schedule</a>
      <a href="" class="list-group-item list-group-item-success">- History</a>
    </div>
    <a href="#onlineshop" class="list-group-item list-group-item-success" data-toggle="collapse" data-parent="#MainMenu">Online Shop</a>
    <div class="collapse submenu" id="onlineshop">
      <a href="" class="list-group-item list-group-item-success">- Address book</a>
      <a href="" class="list-group-item list-group-item-success">- My orders</a>
    </div>
    <a href="#" class="list-group-item list-group-item-success" data-toggle="collapse" data-parent="#MainMenu">Settings</a>
  </div>
</div>