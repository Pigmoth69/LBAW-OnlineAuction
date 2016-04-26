 {include file='common/head.tpl'}
{include file='common/bar.tpl'}  
 <body>
      <!-- Main -->
      <div class="container">
         <div class="row">
            <div class="col-md-3">
               <hr>
               <ul class="nav nav-stacked">
               <ul class="nav nav-stacked collapse in" id="userMenu">
                  <strong><i class="glyphicon glyphicon-list" id="opt" ></i> Options </strong>
                  <!-- <li class="active"> <a href="#"><i class="glyphicon glyphicon-home"></i> Home</a></li> -->
                  <li><a href="MessagePage.php"><i class="glyphicon glyphicon-envelope"></i> Messages <span class="badge badge-info">4</span></a></li>
                  <li><a href="#"><i class="glyphicon glyphicon-user"></i> Staff List</a></li>
                  <li><a href="#"><i class="glyphicon glyphicon-flag"></i> Transactions</a></li>
                  <li><a href="FAQ.php"><i class="glyphicon glyphicon-exclamation-sign"></i> Rules</a></li>
               </ul>
               </ul>
            </div>
            <!-- /col-3 -->
            <div class="col-sm-9">
               <div class="bd-example bd-example-tabs" role="tabpanel">
                  <ul class="nav nav-tabs" id="myTab" role="tablist">
                     <li class="nav-item">
                        <a class="nav-link active" id="inbox-tab" data-toggle="tab" href="#inbox" role="tab" aria-controls="inbox" aria-expanded="true">Inbox</a>
                     </li>
                     <li class="nav-item">
                        <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="sent" aria-expanded="false">Sent Messages</a>
                     </li>
                     <li class="nav-item">
                        <a class="nav-link" id="compose-tab" data-toggle="tab" href="#compose" role="tab" aria-controls="composeMessage" aria-expanded="false">Compose Message</a>
                     </li>
                  </ul>
                  <div class="tab-content" id="myTabContent">
                     <div role="tabpanel" class="tab-pane fade active in" id="inbox" aria-labelledby="inbox-tab" aria-expanded="true">
                        <table class="table">
                          <thead>
                              <tr>
                                  <th>Seen</th>
                                  <th>Title</th>
                                  <th>Email</th>
                                  <th>Time</th>
                              </tr>
                          </thead>
                          <tbody>
                              <tr class="info">
                                  <td><span class="glyphicon glyphicon-stop"></span></td>
                                  <td>Product Size</td>
                                  <td>mock@hotmail.com</td>
                                  <td>14:34h</td>
                              </tr>
                              <tr class="info">
                                  <td><span class="glyphicon glyphicon-stop"></span></td>
                                  <td>More Info</td>
                                  <td>assaf@hotmail.com</td>
                                  <td>14:30h</td>
                              </tr>
                              <tr class="info">
                                  <td><span class="glyphicon glyphicon-stop"></span></td>
                                  <td>Shipping info</td>
                                  <td>agasg@hotmail.com</td>
                                  <td>12:14h</td>
                              </tr>
                              <tr class="info">
                                  <td><span class="glyphicon glyphicon-stop"></span></td>
                                  <td>Product condition</td>
                                  <td>jnsad8hudh@hotmail.com</td>
                                  <td>10:01h</td>
                              </tr>
                              <tr class="info">
                                  <td><span class="glyphicon glyphicon-check"></span></td>
                                  <td>My Items</td>
                                  <td>sajf1k3@hotmail.com</td>
                                  <td>09:04h</td>
                              </tr>
                              <tr class="info">
                                  <td><span class="glyphicon glyphicon-check"></span></td>
                                  <td>(No title)</td>
                                  <td>isgv2@hotmail.com</td>
                                  <td>04:16h</td>
                              </tr>
                          </tbody>
                      </table>
                     </div>
                     <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="sent-tab" aria-expanded="false">
                       <table class="table">
                         <thead>
                              <tr>
                                  <th>Seen</th>
                                  <th>Title</th>
                                  <th>Email</th>
                                  <th>Time</th>
                              </tr>
                          </thead>
                          <tbody>
                              <tr class="info">
                                  <td><span class="glyphicon glyphicon-stop"></span></td>
                                  <td>Product Size</td>
                                  <td>mock@hotmail.com</td>
                                  <td>14:34h</td>
                              </tr>
                              <tr class="info">
                                  <td><span class="glyphicon glyphicon-stop"></span></td>
                                  <td>More Info</td>
                                  <td>assaf@hotmail.com</td>
                                  <td>14:30h</td>
                              </tr>
                              <tr class="info">
                                  <td><span class="glyphicon glyphicon-stop"></span></td>
                                  <td>Shipping info</td>
                                  <td>agasg@hotmail.com</td>
                                  <td>12:14h</td>
                              </tr>
                              <tr class="info">
                                  <td><span class="glyphicon glyphicon-stop"></span></td>
                                  <td>Product condition</td>
                                  <td>jnsad8hudh@hotmail.com</td>
                                  <td>10:01h</td>
                              </tr>
                              <tr class="info">
                                  <td><span class="glyphicon glyphicon-check"></span></td>
                                  <td>My Items</td>
                                  <td>sajf1k3@hotmail.com</td>
                                  <td>09:04h</td>
                              </tr>
                              <tr class="info">
                                  <td><span class="glyphicon glyphicon-check"></span></td>
                                  <td>(No title)</td>
                                  <td>isgv2@hotmail.com</td>
                                  <td>04:16h</td>
                              </tr>
                          </tbody>
                      </table>
                     </div>
                     <div class="tab-pane fade" id="compose" role="tabpanel" aria-labelledby="compose-tab" aria-expanded="false">
                        <div class="form-group">
                            <label class="sr-only" for="AmountInput">Email</label>
                            <div class="input-group">
                                <div class="input-group-addon">Email</div>
                                <input type="text" class="form-control" id="emailInput" placeholder="example@example.com">
                                <div class="input-group-addon">Title</div>
                                <input type="text" class="form-control" id="emailTitle" placeholder="Example">
                            </div>
                            <textarea class="form-control" rows="10" id="messageText"></textarea>
                        </div>
                        <button type="button" class="btn btn-primary">Send</button>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
            <!--/col-span-9-->
         </div>
      </div>
   </body>
   {include file='common/foot.tpl'}
</html>